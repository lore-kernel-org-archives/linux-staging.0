Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A8F71
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 09:21:52 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id a7so1853298ejs.3
        for <linux-staging@lists.linux.dev>; Thu, 01 Apr 2021 02:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XZ/WaUQjAmY8KmnixOjdV9SPezviiC6YLCxzwBrmxos=;
        b=mihdA6KGXgxejzuR7cuTDHmcAlNctRHHXCmAVbxWp7nd9m9x4GHKj7HdAtp2YXkKUc
         lM8GnLgjjgokSXmyCTGFEaPd44q19OvdF9LY7WvFzNOZIzAiuMpvSBv1vslRpmp00pYc
         +kcww02Vjeg1I7vu+oV55TynlyTANHmijzJChcKfVWk5QGy+jvG1VMya9FM++Q23gBPH
         6eCarEJJYXePENNj2CN3XFlZJv74TX7+56AAcgpx4JT1YnvgI1dXLcYGiFMsiYPgSJr0
         gnhHAXGptf6YVcTMcRX7vxQ1S/T+VkpxTrV0yiDz2Z6MtCZDa9r+FfLVv/OHoRD/U0U2
         M0kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XZ/WaUQjAmY8KmnixOjdV9SPezviiC6YLCxzwBrmxos=;
        b=Fmx05aZ8WfzdEsgwM1m/OG015hX/UmAY51qg0aFYIWn1TQa+Hz2tV3MDfk2+n71FWu
         3pAKxoORJLZE95I75Rb4A1NMEiPRBpvChaJ1NZfyZXuQxrhMVkIOC7EY+2sFkrcDf+L4
         MTmtyIZsCMYGER8cERtt+3pmnVbw4gkQiJ1ltNYKRNm561+kIxmDDad5JtMrq/w27Agi
         vup3ooUARwj24ylY3JrbwJAh7y01BeUWm/+cXIpxT+CRN4XbGrcZZrnPStnMioAhcvhr
         10XVWyTMbokqR1adalWCgaXLvXaqB1PsuCLHLmrJajY5TQsPX7xdM21K/2rnMYCBrIB1
         neMQ==
X-Gm-Message-State: AOAM533+MTb+6/o0QeXqMW4nB1vgZqn/aaIToIDVmx7QS156xIKJHcKo
	/2Ko7rByMmzgrCMhkKzsJNFFaqs1C1Am1w==
X-Google-Smtp-Source: ABdhPJwfYyd01GZ+9c/2GChvVL0cWDtlVPNd+vRSZ/UuUPSqkX9LhyNllrsTlJeAQ9bHtyreixy6qg==
X-Received: by 2002:a17:907:766f:: with SMTP id kk15mr8203810ejc.24.1617268911020;
        Thu, 01 Apr 2021 02:21:51 -0700 (PDT)
Received: from agape ([5.171.80.247])
        by smtp.gmail.com with ESMTPSA id e16sm3088001edu.94.2021.04.01.02.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 02:21:50 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	dan.carpenter@oracle.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 17/49] staging: rtl8723bs: remove empty if-block in core/rtw_recv.c
Date: Thu,  1 Apr 2021 11:20:47 +0200
Message-Id: <2cb9acb430ea2c37b067f8dbab1509c827a8e200.1617268327.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617268327.git.fabioaiuto83@gmail.com>
References: <cover.1617268327.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove empty if-block

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 5eb9914c48fc..fdba5cb74452 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -535,9 +535,6 @@ static union recv_frame *portctrl(struct adapter *adapter, union recv_frame *pre
 			/* allowed */
 			/* check decryption status, and decrypt the frame if needed */
 
-			if (pattrib->bdecrypted == 0)
-				;
-
 			prtnframe = precv_frame;
 			/* check is the EAPOL frame or not (Rekey) */
 			/* if (ether_type == eapol_type) { */
-- 
2.20.1

