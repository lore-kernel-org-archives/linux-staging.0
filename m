Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A88523A0;
	Thu, 21 Apr 2022 19:20:39 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id hf18so4038159qtb.0;
        Thu, 21 Apr 2022 12:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PNiJSrQTI1Pt1iGSKhItPgbMNPUK9lB0wjRcg9gqMY8=;
        b=GGaUeCDvR9QGBfQTYzXmtA2mY3jKLr6N+hQcsm5N+IJj2Z9qVCHTvvEAgdD+2L0BUm
         gqIK1a4iB7x1C1urijc40bhG9aoWiUhAPRKE7BcUr6/2xUzhd1HZWIe7doK3WA+0PTgN
         dtw7WX3+1dVTUCdBgSLweXtT7iMO8wBegjPHgKX66JKwF3h6z75ir/0SZyo2vNsKReQX
         CdKiRl1kGkstvvGE6DPFC3vsFHPP8GtgrByLDExVb7cLVX8Nqb/YY4kUjma9KxGVImCo
         jcGje/PtOQQGErsLL1jpRb4cVZhKOE/yIWQJ9bX/2Xp35KjHZyEUXlmvEvnGrRaY92iP
         93jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PNiJSrQTI1Pt1iGSKhItPgbMNPUK9lB0wjRcg9gqMY8=;
        b=vLyriYAx8pDmqDywKkCs1X5fAUEk7FYXKKWCHvP01Nh0Zq44hKIS9Je2HtNMv338JK
         n4J97SBHh4LKLgpnveoUAdSp+lCd3yZu8GQ2cZnwk4LMx4f2XOWRQETUU6zeIqDE0OCE
         gHRMRa8HFmj6zcaxyW7hLGl+3GqRGfKuJtCj8qqRQJvfUIJEptiIXD7oWMuw0/COEqkZ
         1BjKW0kL/jIPlZ46ZF7xpB4mgQhuiUcj0qVoNjBhBjRd0xfXzd7CsmFSPb+MOzXQdVCG
         w98OcW1BxnRK+euldbRVgC8yWMsi4167X1ZSxlCcmS5+Bv0ElP8e3FWHUnrPK3gGGSsW
         eaZw==
X-Gm-Message-State: AOAM530FDpFQDhuxVkfEDmcxoSdqMacm52NseCpvhIC4t0tMhDbAABrF
	C/htVypoj8aYOA3aFvADcAc=
X-Google-Smtp-Source: ABdhPJyEzmQKmC7Kb7jfogLSXyLrjxG7Woq7WKpatFjKnInpS2Bgw0GVZhkNAsnyaBMvd4lv2Y7Y7Q==
X-Received: by 2002:a05:622a:120a:b0:2e1:c9ba:e99b with SMTP id y10-20020a05622a120a00b002e1c9bae99bmr723784qtx.685.1650568838876;
        Thu, 21 Apr 2022 12:20:38 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme.wework.com ([4.34.18.218])
        by smtp.gmail.com with ESMTPSA id l9-20020a05622a174900b002f34421b01csm2567736qtk.23.2022.04.21.12.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Apr 2022 12:20:38 -0700 (PDT)
From: Jaehee Park <jhpark1013@gmail.com>
To: Larry.Finger@lwfinger.net
Cc: phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	jhpark1013@gmail.com
Subject: [PATCH v4 0/7] staging: r8188eu: fix warnings reported by checkpatch
Date: Thu, 21 Apr 2022 15:20:25 -0400
Message-Id: <cover.1650568579.git.jhpark1013@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These patches address style issues found by checkpatch in the
core/rtw_mlme.c file. 

Jaehee Park (7):
  staging: r8188eu: remove unnecessary braces in single statement block
  staging: r8188eu: remove spaces before tabs
  staging: r8188eu: remove 'added by' author comments
  staging: r8188eu: place constants on the right side of tests
  staging: r8188eu: replace spaces with tabs
  staging: r8188eu: correct typo in comments
  staging: r8188eu: remove unused else condition

 drivers/staging/r8188eu/core/rtw_mlme.c | 45 +++++++++++--------------
 1 file changed, 19 insertions(+), 26 deletions(-)

-- 
2.25.1

