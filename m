Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C212F2C
	for <linux-staging@lists.linux.dev>; Tue,  8 Feb 2022 18:04:34 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id i15so9846271wrb.3
        for <linux-staging@lists.linux.dev>; Tue, 08 Feb 2022 10:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=esaHoJx4QHm8kkodcqDserNTJ99eLynAuTTriRkvM1E=;
        b=RwcAexFIpLprQCua5xnJFoSaNdoYU+MVkpsruPLL30E6yZFv1NNKJ+PjC6TbHMM7Yb
         SC6SHogzn8WSQNai4UZeqLjqkLOkd5Uxv6TFoc9utacrbG+6ZXlkFQ8f3TE3IZcxRFaT
         NOX0ZGFW9pOB2KtjQeHvhrUVSR8ks3pWAmDsXhKr4T5/Afz+SeHjzakL6I7+Xiq3gvmT
         ZmclHZVIrDyHVZLcXFFYufx3KXJDo8WrEKlSHX+UA82a56qLINrQkP2Gkp/Mn9vaQnBF
         2YQyLdMkY3N2aedfQmoOCK0s8/q882lcyHxdrmDfbXvXKIm/Jktd2Gq6OJODG23n6V6X
         FFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=esaHoJx4QHm8kkodcqDserNTJ99eLynAuTTriRkvM1E=;
        b=ikOhNKwp7VRIluv3TMaZ7/k1NtdLV7RM3VdDjaD/rXTsbrJKQ9YfcT/Wj7tZw8p4MP
         Y9T5UQtAlUbwDdu1RbP+DzAj8h2POwIMn2v68CeEfoMmLRULS2g8rFF8x46lzaN4zq+6
         gz257n+vpMTuvI5hM2z9Sr6hcbukJhJlHwzSFUnotISF76eNndDDFun5IYMcupTfK+Nb
         L+ZnacW8nMn9nA+CSW8zU41qFFB9UQCXyX007UaqvwgENx52RdaWXkgEctWOLP4370mU
         +MQ9Zld/GRtgKeHpfTsFuaOiXQMHcCw1mwHn6uxsYBugqNNxpxDHmbkthVovgqb8X2qB
         zTsw==
X-Gm-Message-State: AOAM531+o+tpoLZgU5YiZf3BgRfFZyohmrTD81D5z9EicjBc90hXiOnp
	3W6UrmR5y66Ih7Hn1MdOFNY=
X-Google-Smtp-Source: ABdhPJwpLWEzuSHz7SS3Lyj8/PRvuGSF9l/ZPSaohSwLn3nPBg2LoIZqy+IfgxG012JNS1OBCWltPA==
X-Received: by 2002:a5d:500c:: with SMTP id e12mr4375442wrt.193.1644343473212;
        Tue, 08 Feb 2022 10:04:33 -0800 (PST)
Received: from localhost.localdomain (host-95-245-2-16.retail.telecomitalia.it. [95.245.2.16])
        by smtp.gmail.com with ESMTPSA id n26sm3176872wms.13.2022.02.08.10.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 10:04:32 -0800 (PST)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v2 0/2] staging: r8188eu: Use kzalloc() with GFP_ATOMIC in atomic context
Date: Tue,  8 Feb 2022 19:04:24 +0100
Message-Id: <20220208180426.27455-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the GFP_ATOMIC flag of kzalloc() in two memory allocation in rtw_set_key().
This function is not allowed to sleep because it executes in atomic context. With
the GFP_ATOMIC type flag, the allocation is high priority and cannot sleep.

This issue is detected by Smatch which emits the following warning:
drivers/staging/r8188eu/core/rtw_mlme.c:1603 rtw_set_key() warn: sleeping in atomic context

Before the above-mentioned changes, checkpatch.pl reports the following issues:

CHECK: Prefer kzalloc(sizeof(*pcmd)...) over kzalloc(sizeof(struct cmd_obj)...)
+       pcmd = kzalloc(sizeof(struct cmd_obj), GFP_ATOMIC);

CHECK: Prefer kzalloc(sizeof(*psetkeyparm)...) over kzalloc(sizeof(struct setkey_parm)...)
+       psetkeyparm = kzalloc(sizeof(struct setkey_parm), GFP_ATOMIC).

According to the above "CHECK[S]", use the preferred style in the two kzalloc().

Changes from v1: Split one patch into two according to a requirement by
Greg Kroah-Hartman.

Fabio M. De Francesco (2):
  staging: r8188eu: Use size of dereferenced pointers in kzalloc()
  staging: r8188eu: Use kzalloc() with GFP_ATOMIC in atomic context

 drivers/staging/r8188eu/core/rtw_mlme.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.34.1

