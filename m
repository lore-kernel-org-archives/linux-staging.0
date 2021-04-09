Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B582C70
	for <linux-staging@lists.linux.dev>; Fri,  9 Apr 2021 23:46:40 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id bg21so3671233pjb.0
        for <linux-staging@lists.linux.dev>; Fri, 09 Apr 2021 16:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=SVHlr9PFsAmGK4+X1iTgg6ZdMx+ehnrMFUWQE+qDW68=;
        b=eqpKB3KjqIKg8bCrXpgqDgvGD6OtrVps761SKfnm3LqgzUVpBis2S1dNnDiQG1WXjs
         QSsSf787BjZNH+sHBNG4u7GHcflzhqNLZiEiBAnC0wUUUW0WcBBoivNP2M1AwrEi0qXr
         n9/dIHILE0SSUHkvbu3x0JHoqTj3oF8N01sT3b+Iy/ZEzG9lD0TS0qhENJ8wvhZeiKmx
         LEpDhiNsBOSPt9qPYSvSCXbIdHsYEg/NpS5OOBDCeKqLc1im4n31ykjY000SrW6sZR8+
         l2wTkiguiny2s/zc+5Ttub+CVSe9Mko8CQYLR7fZRKX3sCm6cZfJ0J2fHSdbgdHGnGIS
         +7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=SVHlr9PFsAmGK4+X1iTgg6ZdMx+ehnrMFUWQE+qDW68=;
        b=R3EZrED1el/c+j6BvbqYAkT2cnHF7puNUj/sIjb/sf3Xh9yXBD5fSOq//qYCSrlO/J
         A1yb3UwTiDXdsFddRVXVDgbuPQm+g0tzWM9Zs+RfqCvvkpZoDu4dtz6tmb8Zr23sMfBg
         XteeivViDuR6r2MD+4YUINVA5Anb5WW7rP3w1OIE7Km9k1mEANa78bzKCXkSqIwd+wOp
         Zc4ORRRgfq5cz53sRLPdUElejOyMh3T8qiVDQsPcR8fUrqVNxC3cM1opoeTShkYZd4Yk
         N3iVRJo3M6TSLMO29PDqmqsSs+gklgcS/QAIlr2PXt2v/3FelmW3UMt2SzmsqvQEu7Ml
         deQg==
X-Gm-Message-State: AOAM533dW+sJwolkDSbxKFllWnpQHeUSYNG476iCWnjZqbOPL8OZKRWb
	AvPdQ5RFFygImFqfj9DHrTI=
X-Google-Smtp-Source: ABdhPJzVU+Orygs2yV5tMEy9uXd4WzHLdQf48nbKmjxhvwz7VtiIIctKHsB4fuXXORy07AaqLBJSHA==
X-Received: by 2002:a17:90a:516:: with SMTP id h22mr15503466pjh.222.1618012000197;
        Fri, 09 Apr 2021 16:46:40 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id w191sm3570429pfd.25.2021.04.09.16.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 16:46:39 -0700 (PDT)
Date: Sat, 10 Apr 2021 05:16:34 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH] staging: rtl8192e: replace comparison to NULL by bool
Message-ID: <YHDnWpWztxeZospi@kali>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixed Comparison to NULL can be written as '!...' by replacing it with
simpler form i.e boolean expression. This makes code more readable alternative.
Reported by checkpatch.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index 65eac33aaa5b..476875125e87 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -269,12 +269,12 @@ static void MakeTSEntry(struct ts_common_info *pTsCommonInfo, u8 *Addr,
 {
 	u8	count;
 
-	if (pTsCommonInfo == NULL)
+	if (!pTsCommonInfo)
 		return;
 
 	memcpy(pTsCommonInfo->Addr, Addr, 6);
 
-	if (pTSPEC != NULL)
+	if (pTSPEC)
 		memcpy((u8 *)(&(pTsCommonInfo->TSpec)), (u8 *)pTSPEC,
 		       sizeof(union tspec_body));
 
@@ -328,7 +328,7 @@ bool GetTs(struct rtllib_device *ieee, struct ts_common_info **ppTS,
 	}
 
 	*ppTS = SearchAdmitTRStream(ieee, Addr, UP, TxRxSelect);
-	if (*ppTS != NULL)
+	if (ppTS)
 		return true;
 
 	if (!bAddNewTs) {
-- 
2.30.2

