Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A168271
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 03:26:05 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id u14-20020a17090a1f0eb029014e38011b09so3434032pja.5
        for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 20:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cp9Q3q4NFkapY3F7PFjTBCPu8I2/yhix4VA8BHzZzls=;
        b=jyL39EPKMRbMkF0H8rbw6NZX1+zZgJP8rqnJ9V6W7SeaX1Fw+PMHo6LHRRnE71F2xP
         bZ/6MQNeBhJTo1CzCfmYpLq5c2VubtyUZr0eiQtmNy2RGP3QU+wu/ca5sMZFgXLQuK95
         i6gRCxHKrHH2qCctRZJRKtDFah5eRxFykDujHolvqAodLegAzHmvJFRej3zVNy9rgwtU
         kz/gLWmS3UJ/T0Hrp9OQBYtoKT6nM4qy6B1PQ6oQnMoAavfe2PhjnkL7nbSGS6yNNCPI
         w1niRXACKkVIzC2zt3lRl7jkhwVgTPPIKSC7ftfHuBNpC/mMdNLn2ZE3tbu6Uryrn5UO
         3zBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cp9Q3q4NFkapY3F7PFjTBCPu8I2/yhix4VA8BHzZzls=;
        b=Hz40CHWUI69xdv0c1gmTDpquomwUYq9o8OyrDxlWsxmeclpFkaUOMCkQLAutEgQUg9
         OeSFKqEwQmBqiuma7rGeqvHZXqwVg4Dvpt+lQGDiZsQQZzIs9COxrr7T3ZxE2015k77E
         ETj5IWwNGYJjTyRyoSLyFiyHh5hYzmpV/dk39vi1aR/Gl5mY5LhTioQES1yZtjC5u2hX
         H8+WjJbGLvicZkyF0zQiXwpu6YOlY+aAn6E4lie0SP/JFu6qG4nrUKLclcSoOANT0ou0
         BKIC4ReZVLUo4DAt9GwzhbKgi9WLHZ/3aMJn9mO3vrk4W057tYkDQ0ca2mXlS66NaGRI
         MgmA==
X-Gm-Message-State: AOAM530bU51bjjXswsa4oUBHUF57vlIJ5YhpNR66EZknz5y+OsPEENVk
	9iAu5TzYJuQyHQNHhwqvH5s=
X-Google-Smtp-Source: ABdhPJwPBj4usCtQBUi8pHfrA3aalNYSfLkG0mr4ylFDBqGGii21/i1YneBshIqaxZsHVc6efl6mpQ==
X-Received: by 2002:a17:90a:a403:: with SMTP id y3mr2490713pjp.227.1618284365145;
        Mon, 12 Apr 2021 20:26:05 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id h19sm11284507pfc.172.2021.04.12.20.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 20:26:04 -0700 (PDT)
Date: Tue, 13 Apr 2021 08:55:59 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH v5 3/3] staging: rtl8192e: remove casts and parentheses
Message-ID: <4a26a0e155e3ea1ed48aad5a1df4b543c35346f5.1618283232.git.mitaliborkar810@gmail.com>
References: <cover.1618283232.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618283232.git.mitaliborkar810@gmail.com>

Removed unnecessary (void *) cast and parentheses to meet linux kernel
coding style.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 
Changes from v4:- Removed unnecessary casts and parentheses.
Changes from v3:- No changes.
Changes from v2:- Rectified spelling mistake in subject description.
Changes has been made in v3.
Changes from v1:- No changes.

 drivers/staging/rtl8192e/rtl819x_HTProc.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 431202927036..ec6b46166e84 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -646,14 +646,10 @@ void HTInitializeHTInfo(struct rtllib_device *ieee)
 	pHTInfo->CurrentMPDUDensity = pHTInfo->MPDU_Density;
 	pHTInfo->CurrentAMPDUFactor = pHTInfo->AMPDU_Factor;
 
-	memset((void *)(&pHTInfo->SelfHTCap), 0,
-	       sizeof(pHTInfo->SelfHTCap));
-	memset((void *)(&pHTInfo->SelfHTInfo), 0,
-	       sizeof(pHTInfo->SelfHTInfo));
-	memset((void *)(&pHTInfo->PeerHTCapBuf), 0,
-	       sizeof(pHTInfo->PeerHTCapBuf));
-	memset((void *)(&pHTInfo->PeerHTInfoBuf), 0,
-	       sizeof(pHTInfo->PeerHTInfoBuf));
+	memset(&pHTInfo->SelfHTCap, 0, sizeof(pHTInfo->SelfHTCap));
+	memset(&pHTInfo->SelfHTInfo, 0, sizeof(pHTInfo->SelfHTInfo));
+	memset(&pHTInfo->PeerHTCapBuf, 0, sizeof(pHTInfo->PeerHTCapBuf));
+	memset(&pHTInfo->PeerHTInfoBuf, 0, sizeof(pHTInfo->PeerHTInfoBuf));
 
 	pHTInfo->bSwBwInProgress = false;
 
-- 
2.30.2

