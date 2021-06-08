Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C7472
	for <linux-staging@lists.linux.dev>; Tue,  8 Jun 2021 11:21:24 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id a11so31304020ejf.3
        for <linux-staging@lists.linux.dev>; Tue, 08 Jun 2021 04:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3Xr+IY5qcdEYEQUsNiCMfqH1+q7GDdk2pyxDjbZ/SfA=;
        b=WEdd8YsHCEY5xEn66qtoYbItau6L2De8KpR1yJGPeShWtKo3QXRbxQBJY06li80CIw
         XV6ejeuXGfxd/UdWgR6HbHm5EZtDbfVai/nihkGEt7B/IDsPIQd3gnklWDKhnfM3aiq1
         eHkEf+LQGdPlYsEcUWHJJGcMypjobEEvSH0zWfFTCq65/gxjUNmbjkllQH/rZd13P4jD
         aUYzokxxiGyIC0MyDlKu3/3V5QvaN9FsPfraJZHWv8SWAg0RbuNQiAwxkNAI/ZZCAdLz
         OhBjt1QBjE2vgyi7V1EeV6igoi7JWUmMaWomnzVuMr5WpEg2EM/R3fkJcm3aXPwZkLED
         qk0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3Xr+IY5qcdEYEQUsNiCMfqH1+q7GDdk2pyxDjbZ/SfA=;
        b=fslfycdlyCcVXPV64VpCBZdLZintXgER4BWYW/wSDyevwgKnWFG1l1J4Bolo+OGKI5
         bNjJ2SKXEsnGoZpmpGRghBOqe4WbWJHd9vExuHjaO2bw6SUh9oM40tqZsu5Cmb1it72/
         9UmT69GXVeGLzjqavX8yRi9xzWC2MNEhkuUHNe80wV7XEyqnQOi/qJQmBmScxWT+cNiG
         LWJI5jRey7AUmZt8Am+KuPjc3NxLK3lxwZmQiNS9Yx6KQtRSb54LqG9N39sfYHlLxnDX
         DzMKPJDv0QtUfiHunk1A7EG00DC2p3xbQxg78+RGYqUaNaVEAxZALzXijUfPIziQPmwB
         nkiw==
X-Gm-Message-State: AOAM5314HvdoW93JLCQUlomANhiDtbKvP+jFsbxCBZ6oFuVsSDYqpcVx
	gGaxouRWLOSMmenBEki5f4Q=
X-Google-Smtp-Source: ABdhPJwudGlga0r0YmjTDaeM7SQOckRxmpyLGJldYIA/dFopBv6sY192fCSt9TYN7m6vk5GuemL5Uw==
X-Received: by 2002:a17:906:fcb0:: with SMTP id qw16mr22709497ejb.269.1623151283154;
        Tue, 08 Jun 2021 04:21:23 -0700 (PDT)
Received: from linux.local (host-82-59-55-132.retail.telecomitalia.it. [82.59.55.132])
        by smtp.gmail.com with ESMTPSA id r21sm8930448edy.78.2021.06.08.04.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 04:21:22 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH] staging: rtl8723bs: hal: Delete tests with no effects
Date: Tue,  8 Jun 2021 13:21:18 +0200
Message-Id: <20210608112118.1213-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Deleted tests with no effects. Detected by Coccinelle.
It seems that these tests have been inadvertently
left while removing BTC_PRINT logs in commit 8e30fb99d729.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
index 6822990bca7f..3829701f10f9 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
@@ -410,20 +410,12 @@ static u8 halbtc8723b2ant_ActionAlgorithm(struct btc_coexist *pBtCoexist)
 				pBtLinkInfo->bHidExist &&
 				pBtLinkInfo->bPanExist
 			) {
-				if (bBtHsOn) {
-					algorithm = BT_8723B_2ANT_COEX_ALGO_PANEDR_HID;
-				} else {
-					algorithm = BT_8723B_2ANT_COEX_ALGO_PANEDR_HID;
-				}
+				algorithm = BT_8723B_2ANT_COEX_ALGO_PANEDR_HID;
 			} else if (
 				pBtLinkInfo->bPanExist &&
 				pBtLinkInfo->bA2dpExist
 			) {
-				if (bBtHsOn) {
-					algorithm = BT_8723B_2ANT_COEX_ALGO_PANEDR_HID;
-				} else {
-					algorithm = BT_8723B_2ANT_COEX_ALGO_PANEDR_HID;
-				}
+				algorithm = BT_8723B_2ANT_COEX_ALGO_PANEDR_HID;
 			}
 		} else {
 			if (
-- 
2.31.1

