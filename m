Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0927D7C;
	Sat, 22 Oct 2022 07:07:13 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id bx35so455456ljb.2;
        Sat, 22 Oct 2022 00:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/Jixh+fpGeoRUrSiUP31EewhYoOg//pK7EUFnRWzmw=;
        b=E6LyThuoqqIGcCzOD9uvSNSj5QJPyHrtjO57xPt6jnTjmAgIq0ve1Q0XQfOPLmaYrJ
         +nS9WeAGgmx9KViD7Daa0/n0+Xt4CXYA/nA9X8r1L/R3buraKv3TQ9tLrc+TQTJ3Ojdb
         O4xJ++ENTE7vKhA01/OG0Fh8pEuarrMqQlu4HG1BUK8tSw2dMKwy5q8jqrjJBSWwfkNM
         TX47sf0KYRDqY9cR8BMjy6WKPS/z71nw2d1dx8OGwyboLQSMCKtyOStdCd/0i4kxjEtp
         7eYQ6Ep6/IukjawdlW3L7Lj4FfarTrux4ln3oZudfQeowX+oO+kSNRpraQqAk/MDSbg/
         5pZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/Jixh+fpGeoRUrSiUP31EewhYoOg//pK7EUFnRWzmw=;
        b=sZxBwhmhe2bpmsK+9nePVvYud4AA4CP3PGvN5pFlNIPa/4te3GzMrwQD70O1oYrm2i
         0YPDvIaIi51CYIWd5l2pX5AJwYvw/kYB5Th9Biyu83O28kdi+XZlYCUPdroUd42kPi6M
         OKLLWzyX3rCiGpzlEdFuNTfm/vEbk13roHpY5aqOVkCVO330zEQBiAijAipBKuSz4G+b
         oo1SH++XfPOiJ1pNJLDf5ru3CGY1PEsHpzYN3h3a/kzCHXrtQLrU9xZ5rbAHYg52gMqM
         pZiEUfGupzXjKerKjbgm//z7glXWKyPVigBhjHCwZGrzGiWddQQMo9FMHJyHeW8IeuOg
         qwlg==
X-Gm-Message-State: ACrzQf00h2u/5ZM8n0BS/EjBH0kUMlFlC5cCnkf2kpKlfzul6u8KtZRz
	pf/N+59NsBwFvoQZV7EEvWQ=
X-Google-Smtp-Source: AMsMyM4UrJa0//aaoXODXbD3IQteFe712Wz8Xa9AwhO/1oUJkca2RkUyFNUI2aDB8uVB1h3+YLL3FA==
X-Received: by 2002:a2e:8514:0:b0:274:7384:fc5 with SMTP id j20-20020a2e8514000000b0027473840fc5mr4402354lji.52.1666422432197;
        Sat, 22 Oct 2022 00:07:12 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id s5-20020a2e1505000000b00276d2537921sm390404ljd.59.2022.10.22.00.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Oct 2022 00:07:11 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH v3 6/6] staging: vt6655: refactor code to avoid a line ending in '('
Date: Sat, 22 Oct 2022 07:06:12 +0000
Message-Id: <20221022070612.13009-7-tanjubrunostar0@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221022070612.13009-1-tanjubrunostar0@gmail.com>
References: <20221022070612.13009-1-tanjubrunostar0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

join unnecessary split lines to avoid them ending in '('

Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
---
 drivers/staging/vt6655/rxtx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index 572be45cdbeb..c991619763da 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -1300,10 +1300,8 @@ static void vnt_fill_txkey(struct ieee80211_hdr *hdr, u8 *key_buffer,
 		ether_addr_copy(mic_hdr->addr2, hdr->addr2);
 		ether_addr_copy(mic_hdr->addr3, hdr->addr3);
 
-		mic_hdr->frame_control = cpu_to_le16(
-			le16_to_cpu(hdr->frame_control) & 0xc78f);
-		mic_hdr->seq_ctrl = cpu_to_le16(
-				le16_to_cpu(hdr->seq_ctrl) & 0xf);
+		mic_hdr->frame_control = cpu_to_le16(le16_to_cpu(hdr->frame_control) & 0xc78f);
+		mic_hdr->seq_ctrl = cpu_to_le16(le16_to_cpu(hdr->seq_ctrl) & 0xf);
 
 		if (ieee80211_has_a4(hdr->frame_control))
 			ether_addr_copy(mic_hdr->addr4, hdr->addr4);
-- 
2.34.1

