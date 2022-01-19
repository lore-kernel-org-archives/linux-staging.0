Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863C4173
	for <linux-staging@lists.linux.dev>; Wed, 19 Jan 2022 08:43:01 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id i17so1896111pfk.11
        for <linux-staging@lists.linux.dev>; Wed, 19 Jan 2022 00:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=M7jJlTEMEKB2QzR8ziKOvVVAOFD3F55n+Hx6E1xt8NU=;
        b=YBe2dbmtF2RjjHb+admP4DumYuDawvkxYKiXsKcv0EuRD7d9qSwGWWbqnyfO2+NfrC
         57W+/LSbVvv38WvxkgqYR7TK4LKEuMoV8+FVuc9obDqhyxDmhCs8LWRQm4gsBAMYXiQR
         f2fuRFILbBqb7lPXHsxROiK/fQ9fsOWDtzgkVpvwE+c76D7lf+w5csI1l9efH7FTJbnN
         cpz4OIAaA184NATTg/DfDvOURjcQgV8xFC4EiqNMSz+420ZbNS91IBkW2e+MiGSkIy2G
         +zuW3COXewmsSmm1Oy1R5bMkH5iyZytq7EWFpLiShLE88IYroI1TIeKQAduHksPMcvfP
         GeNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=M7jJlTEMEKB2QzR8ziKOvVVAOFD3F55n+Hx6E1xt8NU=;
        b=7leuMkEYvZMehiZGT8TD7UKA6SUbK4vXtBszA0J53nd6hIlnZ9Z/mgrLDql/qx0A9Y
         FhenBPE6rLqeqkHB6vDbVgOh5xERY/fM8vrfzWep/11qH8yD5TQfxBt/KUkCLfg0nkrl
         zQHAwSNwLRYCyPCWShnRAaRnSkQdvD0EPBM86e63V6+DaivCkAg/JZ/zsPHh4A4qoDlb
         juLDg+taeOJbideL+fOYjsYtjKK9maQUbdRu4jjWatjIHNifBtO1aDm251zZowzZf3Y0
         bH9X3ItRYR6Y3cjYy35B4EpJ38XzLkysfh4iV8VZKjEmOw7s4JMr8YZuqAAo+LC+18kz
         p2xA==
X-Gm-Message-State: AOAM530IgBHWw9D5nT2wZ0sCT8vadsEvmeTmmZJ3s8ip6oaB+my+MESl
	ugnq31f7BgBOFSRXif50MYFVd+L8FO8=
X-Google-Smtp-Source: ABdhPJzOEFGYx8bUrK1WwCIntSEYIu8tsTw7mMmz+J2KE6kC4rlQwDvcpSmkWFONZT9hFypocI1Y4Q==
X-Received: by 2002:a05:6a00:ac4:b0:4bd:6555:1746 with SMTP id c4-20020a056a000ac400b004bd65551746mr29805763pfl.39.1642581780937;
        Wed, 19 Jan 2022 00:43:00 -0800 (PST)
Received: from localhost.localdomain ([103.70.199.75])
        by smtp.googlemail.com with ESMTPSA id c21sm9469277pgw.41.2022.01.19.00.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 00:43:00 -0800 (PST)
From: Ajith P V <ajithpv.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ajith P V <ajithpv.linux@gmail.com>
Subject: [PATCH] staging: fwserial: rearrange comment to avoid warning
Date: Wed, 19 Jan 2022 14:11:59 +0530
Message-Id: <20220119084159.5759-1-ajithpv.linux@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

fwserial.h comment contains word "bits" 2 times together.
The sentence required this however it produce warning.
Change the comment to make it proper.

Signed-off-by: Ajith P V <ajithpv.linux@gmail.com>
---
 drivers/staging/fwserial/fwserial.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fwserial/fwserial.h b/drivers/staging/fwserial/fwserial.h
index 1d15f183e0fa..ae7cf84ceafc 100644
--- a/drivers/staging/fwserial/fwserial.h
+++ b/drivers/staging/fwserial/fwserial.h
@@ -203,7 +203,7 @@ struct fwconsole_ops {
  * @break_last: timestamp in jiffies from last emit_breaks
  * @hangup: work responsible for HUPing when carrier is dropped/lost
  * @mstatus: loose virtualization of LSR/MSR
- *         bits 15..0  correspond to TIOCM_* bits
+ *         bits 15..0  correspond to bits TIOCM_*
  *         bits 19..16 reserved for mctrl
  *         bit 20      OOB_TX_THROTTLE
  *	   bits 23..21 reserved
-- 
2.17.1

