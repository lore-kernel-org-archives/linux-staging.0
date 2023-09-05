Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69901DDC5
	for <linux-staging@lists.linux.dev>; Tue,  5 Sep 2023 19:46:27 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2b9c907bc68so45082711fa.2
        for <linux-staging@lists.linux.dev>; Tue, 05 Sep 2023 12:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693943185; x=1694547985; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5ry9s078EXiAMlrtPVQmJBgmFI58bw0qDCvSBdknb1Y=;
        b=V488n35J/bA1uITu3GaHp0qqmqzlOzXXiTN1Er2jl1WA4AJN7xuCIoikhyr6rMuLJz
         axG+JYuJiYKOq0Vn6i1Ckyg/X0cTJ6Xc/g/RIQkKwosN+eTEshEH9/4ducqRmraS5MBr
         5zX/dTAGdpMqQseCRoG9bVbo6W921+HBiG7lw++Fohrv+9boSbBD/i6TI8+6EBGLLCw/
         VtmpupEIl95cnEmuYpRaDrvrW10sWdyoCxGEYKHucrEYcNWxXP1Wf0M4cJF/Glp3Hci1
         oBwA6HwPzm2Q04xTFPKVF007OsQFSJdL40jJp7WlPZOkzxRpYfkp7fIDoJd7uSjKH6XM
         A78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693943185; x=1694547985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ry9s078EXiAMlrtPVQmJBgmFI58bw0qDCvSBdknb1Y=;
        b=kBgpQobBaHaLHiZaHRTG5HTQG70cZogCiVJ6DSWqqN1jw+3/Ew01Qf0d3If7tLjQeI
         Pcwj1aQe+Id1Pwbseq4fZLS5pN6WyETIFA4ZHkILWzRYWd18yhB658XUAHHQNVhglMwp
         2EKs0d5OghVoOHaH0cO2q7NbnjhNRCDC1O5Z7Nc/QmpVmfllxNxr92MP3rbPe3tXnlUP
         rP7TUopsVFFmSjqkEn54d5Y8gLSIVrX22aizRIAu1pAr2E+am+ufsMnfd9FiPSrKiKb6
         JqoA+0mvdYPZ7gaKmqbGU7+I9gTwpJa62P0V091mHWMNBwgzd/sd0BHXBz13xlqkpm09
         6G1A==
X-Gm-Message-State: AOJu0Yw6UfCIH4YCMJJSpAMGow40aSHuPufIFbg/9nWqc5xV8UIjljfa
	cWlmNrB94zS0rxEbBMNn661BF1PEfpYhpkSBj3M=
X-Google-Smtp-Source: AGHT+IHoPdop9hvXm0i5hBN7egzbZqC7DkozwOdI3q8cPKNtDNchLFvWIQC0Ns6sWTdVtrnfW146tQ==
X-Received: by 2002:a2e:3c13:0:b0:2bc:d7cb:8283 with SMTP id j19-20020a2e3c13000000b002bcd7cb8283mr569853lja.40.1693943184944;
        Tue, 05 Sep 2023 12:46:24 -0700 (PDT)
Received: from HP-ENVY-Notebook.lan (81-229-94-10-no68.tbcn.telia.com. [81.229.94.10])
        by smtp.googlemail.com with ESMTPSA id n20-20020a2e8794000000b002b9e65912cesm3011861lji.140.2023.09.05.12.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 12:46:24 -0700 (PDT)
From: Jonathan Bergh <bergh.jonathan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jonathan Bergh <bergh.jonathan@gmail.com>
Subject: [PATCH 1/2] staging: vme_user: Remove spurious newlines between define statements
Date: Tue,  5 Sep 2023 21:45:51 +0200
Message-Id: <20230905194551.19146-1-bergh.jonathan@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed spurious newlines in define statements so that defines which
should be grouped together for readability are grouped as such.

Signed-off-by: Jonathan Bergh <bergh.jonathan@gmail.com>
---
 drivers/staging/vme_user/vme_tsi148.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/vme_user/vme_tsi148.h b/drivers/staging/vme_user/vme_tsi148.h
index 63f726e1811a..dbdf5dabaf90 100644
--- a/drivers/staging/vme_user/vme_tsi148.h
+++ b/drivers/staging/vme_user/vme_tsi148.h
@@ -96,13 +96,9 @@ struct tsi148_dma_entry {
 #define TSI148_PCFS_MISC0		0xC
 #define TSI148_PCFS_MBARL		0x10
 #define TSI148_PCFS_MBARU		0x14
-
 #define TSI148_PCFS_SUBID		0x28
-
 #define TSI148_PCFS_CAPP		0x34
-
 #define TSI148_PCFS_MISC1		0x3C
-
 #define TSI148_PCFS_XCAPP		0x40
 #define TSI148_PCFS_XSTAT		0x44
 
-- 
2.34.1

