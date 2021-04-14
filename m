Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D248972
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 06:55:30 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so10316824pjv.1
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 23:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=li/8LTcZkYP0ij3luXshJf509WGvz+vVGqh0dawSB0Y=;
        b=CcYSUiBXjtY32bAijX+00uCERZVfR0ijx9r1mHi8Ke2NkNbFFCsmfPQ8XDwWUqx6g2
         rq8l6ZNbB+1ewED7+Qi9G90cPQGpEsFjL5PdMB8j6vCCmuhkEMQCLKopK6As+fVTG64m
         XbekHJ3DhmR5E52lYa027XFcozyMBagntE6FGWwhzu2V8nGFCrC1/R1cqsXK5ZFUPL4L
         MEjLGP1aNosfz59+SRuWyFFssvwasyWF8Xp37Y3kSkFVLz6AkTgZ4/eUpudLFStqLqpB
         i70B/CiFfRkx/kLs0WHCKs4FGZDTohnhIRzsOfuaFR9mEJGSKpujftlsjTNWe9kAi790
         4JRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=li/8LTcZkYP0ij3luXshJf509WGvz+vVGqh0dawSB0Y=;
        b=HsnniSXw/CYh6qSJYXtYHSJUauxuluNNAaLGz5DEHzXYZMQeTqZ6tJ2kLjltt0ZAfI
         eMIe3U0VktcbzLIgRD58APIRS9msulxJugq6b2EoDZ02DMlxcHPAMRJfsie2RvP3R7ff
         3XECPM5IluEKhsh3JEgUcWKmlX1K0LXkA3zCHQO0k66oJn3B7BxuZ1FiYFbq6f7WMqXO
         dGq5wD8VHNWGqTvSnaOINcjVkal8kISXx2GvCtV0hBUE5128/wlI/rlyO7Ks0XetTKyw
         urbn9NI2EQBQb5jVA/a3T5YQHdm3kOxLuX3aZh1cpqqajH1oLOiUSRl01uWxD0fouhA9
         ZV2Q==
X-Gm-Message-State: AOAM532qNusuTDiGdBotfxPZHwQJ6QbrAvszUWwpcw+uBA4lUH+EwP9Y
	vblbiuT1LqL9URJ27jWD5q8=
X-Google-Smtp-Source: ABdhPJxmr/Xq5zQXhlTBNg/eAp5Z2ED+EB5zmUKnDQulrDhO5eh1YrrmtMa9R69f5oKi05gbc9DLog==
X-Received: by 2002:a17:90b:16cd:: with SMTP id iy13mr2076708pjb.46.1618383330372;
        Tue, 13 Apr 2021 23:55:30 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id k4sm16677159pgm.73.2021.04.13.23.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 23:55:30 -0700 (PDT)
Date: Wed, 14 Apr 2021 12:25:21 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: gregkh@linuxfoundation.org, davem@davemloft.net, kuba@kernel.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH v2 2/5] staging: rtl8192e: remove unnecessary blank line
 before brace
Message-ID: <cad6a7885f30dcfabaf1ccab1fd0644416fea194.1618380932.git.mitaliborkar810@gmail.com>
References: <cover.1618380932.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618380932.git.mitaliborkar810@gmail.com>

Removed an extra blank line before close brace as it was not necessary.
Reported by checkpatch.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 
Changes from v1:- No changes.

 drivers/staging/rtl8192e/rtl819x_HTProc.c | 2 --
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index b74c6ac817d4..651441a71646 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -263,7 +263,6 @@ static void HTIOTActDetermineRaFunc(struct rtllib_device *ieee, bool bPeerRx2ss)
 
 	if (pHTInfo->IOTAction & HT_IOT_ACT_AMSDU_ENABLE)
 		pHTInfo->IOTRaFunc |= HT_IOT_RAFUNC_TX_AMSDU;
-
 }
 
 void HTResetIOTSetting(struct rt_hi_throughput *pHTInfo)
@@ -445,7 +444,6 @@ static u8 HT_PickMCSRate(struct rtllib_device *ieee, u8 *pOperateMCS)
 		break;
 	default:
 		break;
-
 	}
 
 	return true;
diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index b14ed3534ffa..34b00a76b6bd 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -192,7 +192,6 @@ void TSInitialize(struct rtllib_device *ieee)
 			break;
 		pRxReorderEntry = &ieee->RxReorderEntry[count + 1];
 	}
-
 }
 
 static void AdmitTS(struct rtllib_device *ieee,
@@ -253,7 +252,6 @@ static struct ts_common_info *SearchAdmitTRStream(struct rtllib_device *ieee,
 			    pRet->TSpec.f.TSInfo.field.ucTSID == TID &&
 			    pRet->TSpec.f.TSInfo.field.ucDirection == dir)
 				break;
-
 		}
 		if (&pRet->List  != psearch_list)
 			break;
-- 
2.30.2

