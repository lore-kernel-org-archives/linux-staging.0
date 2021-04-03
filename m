Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E5B6D09
	for <linux-staging@lists.linux.dev>; Sat,  3 Apr 2021 09:14:50 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id o6so502393wmq.3
        for <linux-staging@lists.linux.dev>; Sat, 03 Apr 2021 02:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0XTNpFKePUpupflX0dLUf675z1Pas224B6agSkT6pgU=;
        b=CNIAVLyL25ley6I8RSugU6rL98P7zwsqcXK+s/tws8nntiUyxeJhyswKyiFZpev1V1
         /F2MotsdHi35I6WOTTiB4JvXKNtYpvNcC7HecOJr3cSYdbHyPVOBxh8Rnjq8CZ5eGi50
         QZ6+va+b1WFbQQE51DsPf5FRFh3TACrzk/+hUNK75hWo2/W0AXAVIP2lfnkekIN9etTF
         eAMTsU2oFmslTju93M0X8RcUhCoG9xv5BD3uaxJvbItKOZTBmOuYWc+OvXCi1hXveRh5
         LDReOpEtRfrH3leE0UNbzB/i5r2Y1KGRST0UPAOXbWHpinJTtUkt/RhPaiA2ruY8Ghl7
         dELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0XTNpFKePUpupflX0dLUf675z1Pas224B6agSkT6pgU=;
        b=cFmQq6np8q4rKOHAF48FpusnoBkQT3PNqZmt6pAE+LNz90tGcx6Sl385W2ua98LeQk
         l71Oz01RyFEtKQsZoLEvn/0TPxLrmkvg1eFjeSYQzXAS+pRwABeo3XLQCaPEaE32jn/3
         eqaAg801p2w9xpW9jNb8lYH/4SCt6vAcemGiPTPbJCYMZjCHaSyNZ7qV8NNYgwb/Sl37
         Vk90h+yjwVm1IGNxdGK8dtiDPGupQdrAyQTzyWQ7XobRHnsqp5iVNtY1Hc0A6kAQaXsK
         oERNyP5klNdOTrB3+l2qnxDkkOTD1k482mqr9sgXe7Mrau2aWe8/mRmmPPmzmv8yLFOA
         FZJw==
X-Gm-Message-State: AOAM531IESNk2FSauTDdj48qqZMy91flKxY8A0wjgDilWIL0PGp5k4Du
	lIXIx+jC5KPstpI+rwfJDrc=
X-Google-Smtp-Source: ABdhPJw81yvZaGD14BRyqFaQns6Jg2pVht/XpSVtqc4xmisf9P2Ug93+cCSCaop+YReOPEOAPYr1Tw==
X-Received: by 2002:a1c:1fc7:: with SMTP id f190mr365321wmf.64.1617441288905;
        Sat, 03 Apr 2021 02:14:48 -0700 (PDT)
Received: from agape ([5.171.72.64])
        by smtp.gmail.com with ESMTPSA id m14sm15045666wmi.27.2021.04.03.02.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 02:14:48 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v3 22/30] staging: rtl8723bs: remove unnecessary parentheses in core/rtw_recv.c
Date: Sat,  3 Apr 2021 11:13:44 +0200
Message-Id: <a12ab53aff4dbef02957457f7fdfa8a51e7fb84a.1617440834.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617440833.git.fabioaiuto83@gmail.com>
References: <cover.1617440833.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix post-commit checkpatch issue:

CHECK: Unnecessary parentheses around
'psecuritypriv->bcheck_grpkey == false'
24: FILE: drivers/staging/rtl8723bs/core/rtw_recv.c:381:
+				if ((psecuritypriv->
				bcheck_grpkey == false) &&
+				    (IS_MCAST(prxattrib->ra)
					 == true))

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index c8a13d733c98..cd4324a93275 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -378,7 +378,7 @@ static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *p
 
 			} else {
 				/* mic checked ok */
-				if ((psecuritypriv->bcheck_grpkey == false) &&
+				if (psecuritypriv->bcheck_grpkey == false &&
 				    (IS_MCAST(prxattrib->ra) == true))
 					psecuritypriv->bcheck_grpkey = true;
 			}
-- 
2.20.1

