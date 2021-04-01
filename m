Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D352071
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 09:22:26 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id bf3so1152070edb.6
        for <linux-staging@lists.linux.dev>; Thu, 01 Apr 2021 02:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3T+uihbktGxCHfya3V10ZruR755TNbcOJbAcg/SlH5o=;
        b=EJH7mPmYZkeULTzHgHmmydx5AFSP9LgdoXpu0mpfdIleUQ4rW3b8Q4kyJG9lCE5zm1
         voqm9tavc0yDuPU5fX+cp5XPoclc785g6ya3nX+HpZhzuQ4tGJNvCe4wamuJP+IeWmxY
         9pDXsPOwQk0gPEokMfYK6H69mK6d+JUiAuJOcXhMjdkpbjwNltN1MErvLft9emc/Qoma
         c9E3pBLqV8CMegyE8ceJ2CXMZ8ArchPCVx33OlN+WYFoYncYjwSsTDDPVv+NUPJz+a8u
         CiFim9byp+mM7FHYtxsXHcHpaMIi4KVUX0cNBbTWORO7Jio2AKWBYVj3gjIKumx+amp8
         CJsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3T+uihbktGxCHfya3V10ZruR755TNbcOJbAcg/SlH5o=;
        b=J4I6gjlLclFSoP89xAcDl1QDUdQQKHYlU1Y5JO/LBQpumq951QMXblyulj1Xxb221P
         IraeFceYqoopXZx9uJI+PsCJNQvY0J2qU78P+V5luIx2hoanctbrV9ff87mG+CaHTAwO
         PCiot/9/sdR5sV/3LsV+DTYBPQhatojetL2ObRUoWW2Ql8wuz6w3Si5UCvtPYDLnRPIR
         EdV9oFzSQd6ZK2uHqdaOX1OVyANDRcNlHXBkLTgjbDOvz4zY9FQh0bLKw0D8bDHNwyhZ
         REN7ESnyKUZPnDowDuUxnH6/3NPMhsPUIISojFnRxdZ/SFZMI3UBI0IseSl5jS7muefV
         Npew==
X-Gm-Message-State: AOAM531ujQosLBMiocc9EQ1sm+YEOrhQxFBmOLwh684NyXsYn/sgM0sk
	3wzfwTkRzlE/Q6v9/pGnrhU=
X-Google-Smtp-Source: ABdhPJyNisnWPowSHrSLvcMXQeImXODL6PmShYY87Men0zc9HMQPtUnS/9c74QJB+z9e1oT/MEg23A==
X-Received: by 2002:a05:6402:c:: with SMTP id d12mr8604164edu.100.1617268945471;
        Thu, 01 Apr 2021 02:22:25 -0700 (PDT)
Received: from agape ([5.171.80.247])
        by smtp.gmail.com with ESMTPSA id r17sm3240709edx.1.2021.04.01.02.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 02:22:25 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	dan.carpenter@oracle.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 38/49] staging: rtl8723bs: remove commented RT_TRACE calls in hal/HalPhyRf_8723B.c
Date: Thu,  1 Apr 2021 11:21:08 +0200
Message-Id: <37d2f9e27af11d02f65c9bab4009f2f8aedfb44f.1617268327.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617268327.git.fabioaiuto83@gmail.com>
References: <cover.1617268327.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove commented RT_TRACE calls in hal/HalPhyRf_8723B.c

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index 12f0e3601531..c36513812d9d 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -1847,7 +1847,6 @@ void PHY_IQCalibrate_8723B(
 				bResult = FAIL;
 				break;
 			}
-			/* RT_TRACE(_module_mp_, _drv_notice_, ("Switch to S1 TxIQC(offset, data) = (0x%X, 0x%X)\n", offset, data)); */
 			PHY_SetBBReg(pDM_Odm->Adapter, offset, bMaskDWord, data);
 		}
 
@@ -1864,7 +1863,6 @@ void PHY_IQCalibrate_8723B(
 				bResult = FAIL;
 				break;
 			}
-			/* RT_TRACE(_module_mp_, _drv_notice_, ("Switch to S1 RxIQC (offset, data) = (0x%X, 0x%X)\n", offset, data)); */
 			PHY_SetBBReg(pDM_Odm->Adapter, offset, bMaskDWord, data);
 		}
 
@@ -1950,7 +1948,6 @@ void PHY_IQCalibrate_8723B(
 			}
 		}
 	}
-/* 	RT_TRACE(COMP_INIT, DBG_LOUD, ("Release Mutex in IQCalibrate\n")); */
 
 	for (i = 0; i < 4; i++) {
 		RegE94 = result[i][0];
-- 
2.20.1

