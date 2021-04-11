Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E46A71
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 09:55:30 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id m18so2587520plc.13
        for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 02:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Pl6OK6kvb6mtR1DIS3gsdq/VEoxwoRWU6JF/PodSOew=;
        b=d0N3YN4tNx9oMkqNnL2mTPcK50et2G7T6zeuGSrMpDsxq94gMRHbbie7h3ZWOdyKVD
         Or6cCJB67BsxYon+FwH7SqXHf7Y3Z38s5LL7u64sbYVez68Znu3MR8DqNJsudksvi9/o
         4BHKBLzdvgDPylQBVSLI/ox0aCvHarzT7ARinbjVR6S1/eORWlIq8GQSXiCc5qYZwz/2
         S/MX9W6ocBbGCqPFXIqaiWwAji9TQYOabv1DhQCbDNCfLXx/8nCQVIqU1KvUOU2dG71U
         JX/Grp0wmJuM9KOal5YRjKV49WeO/+a2xhuFH2WQfUkNvCmV0xjNjqp9bp+NlLdhbo/G
         GB+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Pl6OK6kvb6mtR1DIS3gsdq/VEoxwoRWU6JF/PodSOew=;
        b=oi3sxxadX3oHlKE5Rq/h5YgCYpXko1Ih8sXYhDm6XRtNFzjLHFUoQROHRX9ppBmryn
         IgDLY0e7mTOWBhqc6zcrGcxm4WNYHyrjLBJ9zF3Z/HXcQAJVSZK/jk06dmXxTrUgT43m
         K9eu8JsxdOVfCqAqWnJRpFBb5QZ67e4g2W+kOVH2NIwGrAUi0frc4X7tab4WOEQVg7U4
         l/Yej4u2H6sU0UebtswM02VrtJMw491HmBX9UCVyyMlqFxjaBKMelYTj6UJ8fKoZGdQt
         2NESGYd1L2K4Y/cys0tqFPMq3AEF6Z9cM2++FV8c2mUUWdEc9VaQAVq7m5pJ2FmMeg0p
         QNmw==
X-Gm-Message-State: AOAM5314nQbHGYmVQ749jLRgkDjBXpdrkqLGpA2jstbVr/Cd1PNE5zc1
	FPu7aa9y+TNDNai0vvnBHQw=
X-Google-Smtp-Source: ABdhPJxnDhI+RuNyD/XseMkfIfLj+g00jRiD8JHa5cn7IW1wlEyJn60iUtjCMCU2DVe/N6X8dkUcrg==
X-Received: by 2002:a17:90a:c28a:: with SMTP id f10mr24210920pjt.15.1618134930010;
        Sun, 11 Apr 2021 02:55:30 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id f187sm6851467pfa.104.2021.04.11.02.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 02:55:29 -0700 (PDT)
Date: Sun, 11 Apr 2021 15:25:21 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH v3 1/3] staging: rtl8192e: remove parentheses around boolean
 expression
Message-ID: <30a330377667aa5043a60ed3cdf1bbb37099631c.1618133351.git.mitaliborkar810@gmail.com>
References: <cover.1618133351.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618133351.git.mitaliborkar810@gmail.com>

Removed unnecessary parentheses around '!xyz' boolean expression as '!' has higher
precedance than '||'

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 
Changes from v2:- Modified subject description.
Changes from v1:- Removed unnecessary parentheses around boolean expression.
Changes has been made in v2.

 drivers/staging/rtl8192e/rtl819x_HTProc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index b1fa8e9a4f28..431202927036 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -276,7 +276,7 @@ void HTConstructCapabilityElement(struct rtllib_device *ieee, u8 *posHTCap,
 	struct rt_hi_throughput *pHT = ieee->pHTInfo;
 	struct ht_capab_ele *pCapELE = NULL;
 
-	if ((!posHTCap) || (!pHT)) {
+	if (!posHTCap || !pHT) {
 		netdev_warn(ieee->dev,
 			    "%s(): posHTCap and pHTInfo are null\n", __func__);
 		return;
-- 
2.30.2

