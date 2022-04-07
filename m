Received: from mail-oa1-f65.google.com (mail-oa1-f65.google.com [209.85.160.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D04179;
	Thu,  7 Apr 2022 00:09:54 +0000 (UTC)
Received: by mail-oa1-f65.google.com with SMTP id 586e51a60fabf-ddfa38f1c1so4692719fac.11;
        Wed, 06 Apr 2022 17:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z3TZZdYlHpJ9zQ9+NpoUHz/1y7UC3tFPbsEEkYgz4bA=;
        b=c9LOJGRDQMra2LMoB5ZPAOT+aH/VpOSvbkO47XqbH6K8cABaR3uTC2Qg4cgGXXQDWY
         k354xfAnwqN9xynjUpTA/LWBtwmnP61HEH9RplA56vtp9ftLwXL3FVjxH+Y0fOBri6AX
         BGvZ8qlkRrSWG6visci4beQHVkgd7qLfSfmk7o4wt8MWjGB4YTLOG+pRjXnz8YzPis/1
         /6/e6IQQewIsZY6e22Gfh3MD+6NnXz2EVFl+Gy2+EuOXmEQe/TfG0Rr5tA1g2lGT9JAV
         JAcxaRBhtC9Fik4JQkjALoUOeeZyhfwWAmQDss2VAkYl3x6BTLjZLb0YgYlM5gQ+lFn8
         p75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z3TZZdYlHpJ9zQ9+NpoUHz/1y7UC3tFPbsEEkYgz4bA=;
        b=fMbXjzMnc3gCp0LQICvvcX0FRSAyokbwBixnvy4XzA8aWH1RwlnEXYuLF2mW9j2PDe
         fnQMkgmuOpvbKrK6AGk+3sZqyfvOJnY3w39viAEX+8NEO7nyym3ZH6cHuwFnhxKp5bK9
         BZNXulCLeFtGlK1YluEVpkBbAeMEw5BnmcbN8B0AlhK7wSWgZyxgWTVJ8x5wOorKO/r7
         b3nFY5PjQ9FqGy8WOY1tuiYXslsVTeOHKg7UJkaSq24e7F07ZrLHx454l111PLoz1E0b
         ZZnQ5ksarUOJ0StckkwTHp6f/Ni74o1AChQAzsRamuLLV5M8zAsx35r19lKEzA00X524
         IphA==
X-Gm-Message-State: AOAM530Z+eS4tiKEsxb//Dkio78ZA3FH+OxQkwM4xiA7x8XLJhwOO6M3
	JrXxT4CIuV+gYWu9aiOhyVZ1q13LyL4/Yw==
X-Google-Smtp-Source: ABdhPJwx94W0va2ciedTNwdpNQ0uiUlrLDLSOlBdI1+ZpNRj4i5MgVWcvks78AT28AwwsY50SOQ8lQ==
X-Received: by 2002:a05:6870:c189:b0:da:b3f:2b5d with SMTP id h9-20020a056870c18900b000da0b3f2b5dmr5266198oad.252.1649290193810;
        Wed, 06 Apr 2022 17:09:53 -0700 (PDT)
Received: from bertie (072-190-140-117.res.spectrum.com. [72.190.140.117])
        by smtp.gmail.com with ESMTPSA id b21-20020a9d7555000000b005b24c85da2csm7249588otl.51.2022.04.06.17.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 17:09:53 -0700 (PDT)
From: Rebecca Mckeever <remckee0@gmail.com>
To: outreachy@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rebecca Mckeever <remckee0@gmail.com>
Subject: [PATCH 2/2] staging: rtl8192u: use min_t/max_t macros instead of if else
Date: Wed,  6 Apr 2022 19:09:44 -0500
Message-Id: <9855c33d65558f7d2e66805009444288b99f9248.1649288226.git.remckee0@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1649288226.git.remckee0@gmail.com>
References: <cover.1649288226.git.remckee0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace if else statement with min_t or max_t macros to increase
readability and conform to Linux kernel coding style. The _t versions
of the macros must be used to avoid applying typeof to the bit fields
pPeerHTCap->MaxRxAMPDUFactor, and pPeerHTCap->MPDUDensity.
Found with minmax coccinelle script.

Signed-off-by: Rebecca Mckeever <remckee0@gmail.com>
---
 drivers/staging/rtl8192u/ieee80211/rtl819x_HTProc.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8192u/ieee80211/rtl819x_HTProc.c b/drivers/staging/rtl8192u/ieee80211/rtl819x_HTProc.c
index dba3f2db9f48..8f2cd669c5d4 100644
--- a/drivers/staging/rtl8192u/ieee80211/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192u/ieee80211/rtl819x_HTProc.c
@@ -940,10 +940,8 @@ void HTOnAssocRsp(struct ieee80211_device *ieee)
 			else
 				pHTInfo->CurrentAMPDUFactor = HT_AGG_SIZE_64K;
 		} else {
-			if (pPeerHTCap->MaxRxAMPDUFactor < HT_AGG_SIZE_32K)
-				pHTInfo->CurrentAMPDUFactor = pPeerHTCap->MaxRxAMPDUFactor;
-			else
-				pHTInfo->CurrentAMPDUFactor = HT_AGG_SIZE_32K;
+			pHTInfo->CurrentAMPDUFactor = min_t(u8, pPeerHTCap->MaxRxAMPDUFactor,
+							    HT_AGG_SIZE_32K);
 		}
 	}
 
@@ -951,10 +949,9 @@ void HTOnAssocRsp(struct ieee80211_device *ieee)
 	 * <2> Set AMPDU Minimum MPDU Start Spacing
 	 * 802.11n 3.0 section 9.7d.3
 	 */
-	if (pHTInfo->MPDU_Density > pPeerHTCap->MPDUDensity)
-		pHTInfo->CurrentMPDUDensity = pHTInfo->MPDU_Density;
-	else
-		pHTInfo->CurrentMPDUDensity = pPeerHTCap->MPDUDensity;
+	pHTInfo->CurrentMPDUDensity = max_t(u8, pHTInfo->MPDU_Density,
+					    pPeerHTCap->MPDUDensity);
+
 	if (ieee->pairwise_key_type != KEY_TYPE_NA)
 		pHTInfo->CurrentMPDUDensity	= 7; // 8us
 	// Force TX AMSDU
-- 
2.32.0

