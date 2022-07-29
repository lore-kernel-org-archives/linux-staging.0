Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974B52F22
	for <linux-staging@lists.linux.dev>; Fri, 29 Jul 2022 15:26:00 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id q16so4269822pgq.6
        for <linux-staging@lists.linux.dev>; Fri, 29 Jul 2022 08:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pzNLfrCl5rV2i8rqnbdT3o4k9KbeFkIr7Ha5/Z3Q21I=;
        b=ZaSF+z1STM3QtulM2VIw49uRISrGK4kI0+fjdp4uH7FwKvDULDg3GpCTnudDHUhdkc
         9A6/AZGT7OlMkWG4j0gdMFN3upPLKG/WGvstnfrlPCJd4nlkf/3BLfTtIvhkzmfcaQcr
         /7H3Gsur6TZs+3rZP1lkUi6gDyTdVZsPSSY70/+l5SutbG+veUrBJnxMiIA4uq9p5Bkm
         cYDxa27Rd/jnoB+Iqo+Rd5AuS3mK1ArUTtbQWDM7Wo0cT5XJfT4ERwdWpuOtGkEuY4Kg
         nkM28uMWOocM1evlAs8Zcc6rrkz2+cJlF12UWgSbSGFpHlM3f9HcEczGSzd7/huGXhGL
         nDvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pzNLfrCl5rV2i8rqnbdT3o4k9KbeFkIr7Ha5/Z3Q21I=;
        b=64+PAnQKzV2v/RRp/m21X+CfpkXZrgCdhsjkRpemwNR20egrwsBaZ4HMWCdh/sEVRr
         /i0Lwy9K5Omr60FBJik8xerM5lvEDwbr2QV4PgAghvCpxFmm+5/qtgCt6AuNmkvKusaz
         JB0WJF/rOphIuhBE2CbbRYu5cW0/7EHyJSSYpoPQk1HK1/nUsSTBceY/xQPq5AIm9QFD
         82LcqLP0lqJYHq3xdsvqg7sqATHW4ioYwy4WkSxQ0kB73zlSWncv221NM6gp1pJsIiT0
         pHdWFOhcxjSaTpPJLgAfGp+2tohKdfnJnWQW2+d7Rdlg03bJNr+mV3+BDNerovaOCJkc
         oEkA==
X-Gm-Message-State: AJIora8sjJViTWBaMMCzCnfzviVGQc6rU0Fio6aYisMxK9yCx73kCtDK
	jotytRIaA/ToNy/pnQod0rA=
X-Google-Smtp-Source: AGRyM1vgUrdkeWs107TARuGdN4xKS2m2j5IJuXmtCc4+qi/WNslNlPfwA38Uln7msPr34BtLn3u+TQ==
X-Received: by 2002:a63:d90b:0:b0:41a:ff05:4808 with SMTP id r11-20020a63d90b000000b0041aff054808mr3395244pgg.159.1659108359911;
        Fri, 29 Jul 2022 08:25:59 -0700 (PDT)
Received: from localhost.localdomain ([175.195.128.78])
        by smtp.gmail.com with ESMTPSA id b1-20020a170903228100b0016c06a10861sm3804779plh.74.2022.07.29.08.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 08:25:59 -0700 (PDT)
From: Sidong Yang <realwakka@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
Cc: Sidong Yang <realwakka@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: pi433: fix wrong comment
Date: Fri, 29 Jul 2022 16:25:54 +0100
Message-Id: <20220729152554.8211-1-realwakka@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comment should describe the error when user calls rf69_write_fifo()
not rf69_write_fifo().

Signed-off-by: Sidong Yang <realwakka@gmail.com>
---
 drivers/staging/pi433/rf69.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
index 659c8c1b38fd..8c7fab6a46bb 100644
--- a/drivers/staging/pi433/rf69.c
+++ b/drivers/staging/pi433/rf69.c
@@ -816,7 +816,7 @@ int rf69_write_fifo(struct spi_device *spi, u8 *buffer, unsigned int size)
 
 	if (size > FIFO_SIZE) {
 		dev_dbg(&spi->dev,
-			"read fifo: passed in buffer bigger then internal buffer\n");
+			"write fifo: passed in buffer bigger then internal buffer\n");
 		return -EMSGSIZE;
 	}
 
-- 
2.30.2

