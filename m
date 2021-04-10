Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B852270
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 13:00:47 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id y16so6064851pfc.5
        for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 06:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=UGb+/+QBTdjcmOPBbleKfKtPLJksnQcPm+n3W+gASt8=;
        b=TNlJKk2QHf6DUMp1ExtSa9uXzuPXSFsvUI9AIaxi0RSotv+edjw4EGp2O2eWCE0oPj
         /LPgHODBcQAisZRiC5RED/ojXSmMfIMNe7hUTeDeFF5aSHOs2dzW/aVWT2ziTXOVwccf
         zKobpEx50W4hK9CacwVdZpXVDsZSiifnLbhbzKP5n5ExBeM9zGVQxgnLuI2o1vpzJoNB
         WilMwRTNfeIr0uqY3RvKuHY4BRY7Y8Zs0n59P9C03385+fgVHUxkCpOum1fEXwq9/zx8
         s+h0+UroOX1gOV7BR/OSsy+57K6/ttdxXte0qcyH6ItEoiIlfoai8+ufOgOxoiACG70K
         3s6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=UGb+/+QBTdjcmOPBbleKfKtPLJksnQcPm+n3W+gASt8=;
        b=W8DWpUTKtkQ6gsvwWSGLJp/4y0idPfmf2IKxq3UematolIp5Sf2Ms4aTYO05uA1rV4
         TLyPKMCXbxRSuRXLIvls9EEnggOb8pZAp1YVzeH2ryDTiEhNmQZJtgm6yQBdkL49DwmK
         Zeavg4b6UCD9Oh80yCJspJeOb+kWfVbC2KZrXBUwKFhN9asTJrxMktFkVMTR+tkezbqg
         yO+m7HiZ/sG4oxPuaoA1+ZuWBXDSIhJb+erOLuZ7yTeg4PuO04MqXfzGN3Ox/9yXDvQ2
         GINx/pEdKjipgpwPvdZVpHaj+8xj6lssufOnsoaQGBicjCux8FwVtzWWGot4pAHBXuD/
         Olwg==
X-Gm-Message-State: AOAM531e95lem5mErwaTCFLet5RSAuBHvaXmdJvPp71CXZasIkeLnWci
	DyTbyUyX/zDx3t1zQFA91Pc=
X-Google-Smtp-Source: ABdhPJzYcgjyDUn60FRqPJgIQ5PQzJNmo6DputF6cIdX/GoHkLkoq0eh8PueuMkvs04lk4BB3wgyeQ==
X-Received: by 2002:a63:3649:: with SMTP id d70mr17542761pga.1.1618059647127;
        Sat, 10 Apr 2021 06:00:47 -0700 (PDT)
Received: from kali ([106.195.15.71])
        by smtp.gmail.com with ESMTPSA id 12sm1694822pfi.204.2021.04.10.06.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 06:00:46 -0700 (PDT)
Date: Sat, 10 Apr 2021 18:30:38 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH v2] staging: rtl8192e: fixed pointer error by adding '*'
Message-ID: <YHGhdtldqAlRsPHT@kali>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixed Comparison to NULL can be written as '!...' by replacing it with
simpler form i.e. boolean expression. This makes code more readable
alternative.
Reported by checkpatch.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
Changes from v1:- added pointer to the function, which was missed during
fixing v1.

 drivers/staging/rtl8192e/rtl819x_TSProc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index 4457c1acfbf6..78b5b4eaec5f 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -327,7 +327,7 @@ bool GetTs(struct rtllib_device *ieee, struct ts_common_info **ppTS,
 	}
 
 	*ppTS = SearchAdmitTRStream(ieee, Addr, UP, TxRxSelect);
-	if (ppTS)
+	if (*ppTS)
 		return true;
 
 	if (!bAddNewTs) {
-- 
2.30.2

