Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FFA2F4A
	for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 12:54:44 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id t5so5544726edc.11
        for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 05:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=tpAs0I6mi3SUOtwu0/CjcjkIDmk/Vrs04W6AV02/W+s=;
        b=NhPiQyO51UgCQXdF3j2uQqCC9wCloxzP4LFinLB2hRf2wfol/F3UuJgwjzKbhXDsK1
         L2hLK746NxNSM6q6vbbYM+7mqIHavC8P6hsvInYdy/RcIZqCAyVyJ4j9Ev8WNLF/FHOg
         4f0lQx6hgP9AcXTOKqZfB4nZw5EfdPiMFGDDHrEnjx3RI39f2Q7MruizK32z8Qwhe9oq
         raqjkH4Q1STK9Qo1cQjPflAja1eOZQeSbSapJBRhnOfwITzn84ERU8ho9GReeyvbxAiI
         TpXNibgG6Npa8rWvB7cV5Qn2649k4RKxWqpktkm6AP8AgTRPDDQh9xU12sBRDNE786Iz
         OUgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=tpAs0I6mi3SUOtwu0/CjcjkIDmk/Vrs04W6AV02/W+s=;
        b=CESJtFXbzvDR7I6w+2KWDYe9zdI28zAYAg7k8r4yu2JqOGy3YTXQKsylRAUjf376dx
         l+gBjP8vAIpGHb1kijwdnLDHuV3+GHZzPacnOho3Us6t1qKOiXHrdrNa81ujxFCInBWF
         y2PeXzwNze5AFaz7OuCfNTUzrN8L4/M9mTBBeeC0FVviKAbGB+6b205krzZZKUn7251/
         99rvJqPssoYjtyWUdwIpa1LdP1uH/RKVR1DkRyVvdjESbuWX18bDcQFQbs2kBZBx81mD
         RcdCoeF2QvNFVuzTszJ88pHEg79iUUNjCXZAuPOIthhP6kK7D6Xx5s3l4+nJzTP341Tp
         B2Ng==
X-Gm-Message-State: ACgBeo2RwwxpKJFgvk9GOfWtL+gmZlBIc0KUZvNAuN+EiHphF/7CbchQ
	BFFnn/HIbqU5P4n3XNxPYL0=
X-Google-Smtp-Source: AA6agR6qVQcCrDUpgOztkeCznxCfbvHrHpp/3zRAM8C3jGY+6jtCKN/MbpTsHsvH/CjwuSbO51ZZ7Q==
X-Received: by 2002:a05:6402:270d:b0:43a:67b9:6eea with SMTP id y13-20020a056402270d00b0043a67b96eeamr6003185edd.94.1660913682645;
        Fri, 19 Aug 2022 05:54:42 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb77.dynamic.kabel-deutschland.de. [95.90.187.119])
        by smtp.gmail.com with ESMTPSA id b12-20020a056402138c00b0043d6ece495asm3000955edv.55.2022.08.19.05.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 05:54:42 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 06/11] staging: r8188eu: remove unneeded initializations
Date: Fri, 19 Aug 2022 14:54:23 +0200
Message-Id: <20220819125428.8412-7-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220819125428.8412-1-straube.linux@gmail.com>
References: <20220819125428.8412-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the function rtw_reset_securitypriv() three variables are
initialized to zero. That is not necessary because they are all
set before use in the code. Remove the initializations.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/os_dep/mlme_linux.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/mlme_linux.c b/drivers/staging/r8188eu/os_dep/mlme_linux.c
index aff9e18476db..48287aeaf502 100644
--- a/drivers/staging/r8188eu/os_dep/mlme_linux.c
+++ b/drivers/staging/r8188eu/os_dep/mlme_linux.c
@@ -57,9 +57,9 @@ static struct rt_pmkid_list backup_pmkid[NUM_PMKID_CACHE];
 
 void rtw_reset_securitypriv(struct adapter *adapter)
 {
-	u8	backup_index = 0;
-	u8	backup_counter = 0x00;
-	u32	backup_time = 0;
+	u8 backup_index;
+	u8 backup_counter;
+	u32 backup_time;
 
 	if (adapter->securitypriv.dot11AuthAlgrthm == dot11AuthAlgrthm_8021X) {
 		/* 802.1x */
-- 
2.37.1

