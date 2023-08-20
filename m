Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081B6A35
	for <linux-staging@lists.linux.dev>; Sun, 20 Aug 2023 00:45:28 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-76ca7b4782cso150591485a.0
        for <linux-staging@lists.linux.dev>; Sat, 19 Aug 2023 17:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1692492328; x=1693097128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sAOkobjP7Wkz3qWYoXgCw5Zbn+EJxaWf/bYJaog4oo8=;
        b=k2VZ87YKBlm1HUYmHdzMuIb9GMbJCxHTlletAiMw/oLTpVP7RM1wreeYnyx/bZ5los
         C3bILGXuQE5CZgUqzYEBQaD6J+UUS3EIKenWtcg7RCROuFF0Ed+5FNOtlg2uofm+GSqr
         dnPnkyN73QKSqeQP2TdfbXN0CD4wnrHlnFaBQXS6M/H/PwjRynF9RQO+EEZKXdur+8r3
         YRYdodIqqt9+mwUPXkZJTf87+gOdzE3p7/w+bizezQbI8xaKD+zBcgNnz5tHstgxUKac
         IGvVFGa51k+4+jCWdWU6SqggLkOrMlg+bWhricGY2iux53GmPHuuwWPlwn5cc9dMxVOM
         NmuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692492328; x=1693097128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sAOkobjP7Wkz3qWYoXgCw5Zbn+EJxaWf/bYJaog4oo8=;
        b=hAwF+9RTJfsK2sDQMSkT8EZOdxSMNsB1intooZnQ+yVZljB9vz2RKlEWDIkWNpOJww
         XxThh1cHjeufTEg3j7FWLhBWN0F3+Wx6uNjP2Hu6rcMueLayhbHnHugo+i0Di1qSVZrW
         oD0Dq9IChbV7d9HstWIgyBXxl96axxZd+HLZ8VG1E/rXxgs9Om5tA7YOwxRAbJ+wlpj/
         YtFHIq1eXPho4baE+l56HgR7xaH2uRKtq002tOTFIrZU2F6itjQ0w7JOMbX+1jC1vhgm
         xhZ62A6GPTBngp6ipjvepyrpi91Q/Vb2H2rVlqLfHYyBGJVg4YIWeJdJBAJRmaIRMgxF
         ZUNQ==
X-Gm-Message-State: AOJu0YzlLkL3EC7L63zb2pwA87/r6RI3KSFdgbRaRT5GUVZNJMbTpu4a
	8PtEI1lfghXjkn9oA328t5BJrw==
X-Google-Smtp-Source: AGHT+IFegj/z8aF56tvf5mmWpMbfhNfPowM/PyDVQ3EYK+tT6/nq8y8gRAdPO4BNs4xOEZ68PtCjzQ==
X-Received: by 2002:a37:ef17:0:b0:76c:e9d3:cac2 with SMTP id j23-20020a37ef17000000b0076ce9d3cac2mr3698598qkk.27.1692492327816;
        Sat, 19 Aug 2023 17:45:27 -0700 (PDT)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id 25-20020a17090a1a1900b00268b439a0cbsm4004884pjk.23.2023.08.19.17.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Aug 2023 17:45:27 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 11/16] Staging: rtl8192e: Rename variable pTS in function prototype rtllib_FlushRxTsPendingPkts()
Date: Sat, 19 Aug 2023 17:47:39 -0700
Message-ID: <20230820004744.278022-12-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230820004744.278022-1-tdavies@darkphysics.net>
References: <20230820004744.278022-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable pTS in function prototype rtllib_FlushRxTsPendingPkts()
to ts, to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 0c812eb02ba6..9c2817e8a5d4 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -2039,7 +2039,7 @@ bool rtllib_MgntDisconnect(struct rtllib_device *rtllib, u8 asRsn);
  * ieee handler to refer to it.
  */
 void rtllib_FlushRxTsPendingPkts(struct rtllib_device *ieee,
-				 struct rx_ts_record *pTS);
+				 struct rx_ts_record *ts);
 int rtllib_parse_info_param(struct rtllib_device *ieee,
 			    struct rtllib_info_element *info_element,
 			    u16 length,
-- 
2.41.0

