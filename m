Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com [209.85.167.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE1B17FB;
	Wed,  6 Apr 2022 08:31:22 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id i7so1684498oie.7;
        Wed, 06 Apr 2022 01:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fx+PuhUmntAQYILd3k06PDbFUSS94nXmjRNZJ6v+95g=;
        b=HKuwVS9lBQumFrTvaBXETrUzSjYqNbjMNl7pjRJxlNVTM0LSCYzaoeuEG8wBiaBFh2
         I95AWspuU1BhMxIJhwNJX5y+fgLxiysM0gGct2bDvLaOcaG/5esK2fH7GiynQDEv6ymA
         9cVpFqDzbROrLCp3g2i7+cZp6Z5uA+Lviekv+ntvXIKi6ub2jBVcaFPOizk3j3PAXzPe
         jfcdjfQ9f0eH4a6/7Fdlhk25lXsmBeimghJ97EVtMjPmeSrBmPYU8zCMtANGZ8h/2CeV
         8T2lxja9RJc9fbJHs11wVPP9sBEicq8ycbAJ7+Je1Hg49ZNob/GJn/mnBNsh14C2RlTY
         BRUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fx+PuhUmntAQYILd3k06PDbFUSS94nXmjRNZJ6v+95g=;
        b=cTFtPLs3Hmosp3QfaDaSDs3DK7ye2UQsM16PSzAEoxeXpyf1BFNVO+xdn5BidDW1uh
         ps1d6P7EgTNwSYSTtNoE4nKlg1GsNA7lkT1PcLqn4mQNuYxTEM57IdtZICy5624ASa/q
         10swCXd/egTlDsiHnGd0Y57NCPXH7FU7bgZScssQufH8HCEYze3fGEeDske09gUadq2A
         O4h2hCCDVc3lv+YGcVg8J81CEmg8snezgpmUCTFAF6CMACyqAYxun0PIqtlTL8DUTM8a
         wdYhulCd2luQSH3dz8SH4rcjgerxhx+6EVutO1wo40/8KPMrbajf3+TQ2NJLO/zMxApn
         Oe9A==
X-Gm-Message-State: AOAM530IQVikoQ5tU47t4O9CJfs7uSlWyXQial3n+qwoqN0eTw3D68js
	EqE0d+DQ0jN5pAxKnsZho6eKHOAuh2LoaA==
X-Google-Smtp-Source: ABdhPJwqQwGchpMu2EMqAUxEdYcA9AXmytNB8OfGtkuDjeuI+izYShm5jyAzP89LrhVRvqqlRT7Y0A==
X-Received: by 2002:a54:4518:0:b0:2ef:8719:b041 with SMTP id l24-20020a544518000000b002ef8719b041mr3263934oil.188.1649233881904;
        Wed, 06 Apr 2022 01:31:21 -0700 (PDT)
Received: from bertie ([172.58.102.145])
        by smtp.gmail.com with ESMTPSA id i28-20020a9d4a9c000000b005ce06a77de2sm6938116otf.48.2022.04.06.01.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 01:31:21 -0700 (PDT)
From: Rebecca Mckeever <remckee0@gmail.com>
To: outreachy@lists.linux.dev
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rebecca Mckeever <remckee0@gmail.com>
Subject: [PATCH 2/4] staging: r8188eu: remove extra 'the'
Date: Wed,  6 Apr 2022 03:30:58 -0500
Message-Id: <e259a035b79c814f871b490aa277bf0dfe23fe11.1649233201.git.remckee0@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1649233201.git.remckee0@gmail.com>
References: <cover.1649233201.git.remckee0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove repeated 'the' in comment to be grammatically correct and
conform to Linux kernel coding style.

Found with checkpatch:
WARNING: Possible repeated word: 'the'

Signed-off-by: Rebecca Mckeever <remckee0@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 9f5ece52bd39..cd20811ae152 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -519,7 +519,7 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 
 	psecnetwork->IELength = 0;
 	/*  Added by Albert 2009/02/18 */
-	/*  If the the driver wants to use the bssid to create the connection. */
+	/*  If the driver wants to use the bssid to create the connection. */
 	/*  If not,  we have to copy the connecting AP's MAC address to it so that */
 	/*  the driver just has the bssid information for PMKIDList searching. */
 
-- 
2.32.0

