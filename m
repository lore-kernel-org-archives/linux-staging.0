Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4EA7A
	for <linux-staging@lists.linux.dev>; Tue, 14 Jun 2022 15:59:15 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id s12so18092233ejx.3
        for <linux-staging@lists.linux.dev>; Tue, 14 Jun 2022 08:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I6VKVhNV12BqYvdKkWEFx5TpD+CKWu2FsSp0oxzNzYM=;
        b=bzQjmrUKVWoxYAWPQ5h76mfm5RHFWv8cI6qKQmH7E4Pb2ldPY3oL6YwtE9UjNUnfBk
         418IbHs/cl3nHNmKkhRT/6F3yul9NFJOcMGmfLsU4gyx3sPxuvo60U/vREY090V5x+hQ
         H3v1DZzw6ULpZFnMJoEQpI8IRsrIzRwmuILaSVrlHFNjsZ3C+6Mfexj9tOsJJcHxjwrq
         SqJq9eRmGb+dDNnia+5bKELt32E2ufY7Er11maQ+Zv+pdh6H75kGMwhLcTxF7aDVXO3E
         76Cwtk/gZSmHctR44KqyGtbZmD8k7E8iAXJZ3U6WjeHtNBJIXa8ZFNx3KUB1e0dwyzX8
         rICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I6VKVhNV12BqYvdKkWEFx5TpD+CKWu2FsSp0oxzNzYM=;
        b=n7I0garj2v8XUuZN5N/4EyOHVbBcDc4phvD27R0bLQ+j+s+1tEvOefpMVzsR9/oPLJ
         xltQ+CA0uHLC2ryl5b1jRCGoNOFUmyj1kRiLhlpHN0Q9iYCssF6krHUsq00qgabXZuaH
         bjgHRIkCYgBN1Wn1/pYxbGk9C3TKu1tKz4i7/3Vs9eCx5q0WNIc0IiAzJiHi+KK6N7rZ
         Eev8slEt1x2B366B3ndMVigPenWLq7q+bEmcZsKNnUI3k2RNJyb76LLErXNed9Wd/tAV
         StlCq96agF/KVlLFyMZ2VEYVxmLQp67lW6pq5/z00xyY+bEGgWhON443Lx+DPWomzuQm
         HSEw==
X-Gm-Message-State: AJIora919+f3BZnJD6XkAafMSHa2Wn5aSnl8BtCPgI8qMA1sO0vGF17D
	hHDXGEC8qHCvtA/SRugLESk=
X-Google-Smtp-Source: AGRyM1uTusRcT6pmrCq+uVZtoE2aMTyOt/RO0y80Vspavy1q0UAxwDlegDSgcbeQ+Lp048SvG8Mp0A==
X-Received: by 2002:a17:907:2cc5:b0:711:d50b:287a with SMTP id hg5-20020a1709072cc500b00711d50b287amr4896923ejc.47.1655222354125;
        Tue, 14 Jun 2022 08:59:14 -0700 (PDT)
Received: from nam-dell.fritz.box ([2a02:8109:afbf:ed88:c58b:f186:2720:bdac])
        by smtp.gmail.com with ESMTPSA id qk10-20020a170906d9ca00b006fed93bf71fsm5327928ejb.18.2022.06.14.08.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 08:59:13 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	namcaov@gmail.com,
	phil@philpotter.co.uk,
	Larry.Finger@lwfinger.net,
	paskripkin@gmail.com
Subject: [PATCH v3 0/2] get rid of confusing macros
Date: Tue, 14 Jun 2022 17:58:43 +0200
Message-Id: <cover.1655220367.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <YqhWIiXadDC3hzel@kroah.com>
References: <YqhWIiXadDC3hzel@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace some confusing macros with more explicit codes.

V3:
  - Get rid of GET_TX_REPORT_TYPE1_RERTY_0 and similar
V2:
  - Split into smaller commits so that it's easier to review

Nam Cao (2):
  staging: r8188eu: replace confusing macros
  staging: r8188eu: remove unused macros

 .../r8188eu/hal/Hal8188ERateAdaptive.c        | 12 +++----
 .../r8188eu/include/Hal8188ERateAdaptive.h    | 13 --------
 drivers/staging/r8188eu/include/basic_types.h | 31 -------------------
 3 files changed, 6 insertions(+), 50 deletions(-)

-- 
2.25.1

