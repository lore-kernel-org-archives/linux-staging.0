Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027A163B6;
	Mon, 27 Mar 2023 17:13:56 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id p13-20020a17090a284d00b0023d2e945aebso11419137pjf.0;
        Mon, 27 Mar 2023 10:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679937236;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YTxnICyACcYyrkEecWGvFx2Lv9BMykftFbe2Wex0fDc=;
        b=Txo9gHrovk+y74juJztl+stEEUDPT6H73vBBnA5KKkqubPkDnbJC5+RdXUgw4TbOCa
         R96SK0U5QWM36ih6e3JAu942NvucO0CHILGMNU+QbotMNF6jf/T/0Fa1KaiilS6Oex2O
         CHwncFX4IzgJxfYFqWDdONL9ff/eRaPseFklo8/zjaOidbG6ZiHejBlFrIAUCnl8kz3Z
         RRutBIPsf3U5UtYBGWePJeGzx/pg4h1V/aqyVmklG0TJdOVXALLmQx/OVn4v5W5KR2cN
         EImX+91GLPbaVB8V9HEGCzoIdD0ensVZE6iUOHtzyYAjfjruPbJmqpTA7PQWnWWM7hP6
         Jbxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679937236;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YTxnICyACcYyrkEecWGvFx2Lv9BMykftFbe2Wex0fDc=;
        b=GEH+FrUEBCs2ANQG+MT01vCIYcuTbhQtJQ0E6bwd95/UvbA5v9rLxbSi2mNJQPZv9I
         T1TbesXFyFAo3vv64u5TeXfXZ4XHhJx7zXQvZ4Tj1ccvLCpo4cvjRsTUUmes8/4t8/WW
         zO0t77EDgHQWx0Ik50hCfsQaM+B6fk315w60czaVhSqQjoAdt8e2VEQJCs2cPvOtP4FH
         d8460vSUy0G2mgGF0JWmSnj4rhVYjh2PyuQO2Es5VFEt860JJ3kCP3QYn7UV+Dc0vs47
         W+OGWdgKXg4hS/GH7AZO+QGBXdBGxtaoZX9bIELgeDhW8JLoU3hCJ5lr2f6yC8V3W0+W
         7Ngw==
X-Gm-Message-State: AAQBX9eyONc29EHucopZbd3+xZ1JuFcJEq12c0Zz2eWKn6z2pZEAACB2
	T6ABKRxixmAFpSbSM5PiIKY=
X-Google-Smtp-Source: AKy350aqYyOOidnWDAt1JEPXWZkd7QjsEbExpBR1/9gQIiDyaaqIT7L3LNEi2B5t+vdzHlcXRt9SGQ==
X-Received: by 2002:a17:903:64b:b0:1a1:cc9d:3d55 with SMTP id kh11-20020a170903064b00b001a1cc9d3d55mr10073117plb.20.1679937236123;
        Mon, 27 Mar 2023 10:13:56 -0700 (PDT)
Received: from sumitra.com ([59.89.169.114])
        by smtp.gmail.com with ESMTPSA id d2-20020a639742000000b00502e7115cbdsm15560708pgo.51.2023.03.27.10.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 10:13:55 -0700 (PDT)
Date: Mon, 27 Mar 2023 10:13:51 -0700
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: outreachy@lists.linux.dev
Subject: [PATCH] staging: rtl8192e: fix line ending with '('
Message-ID: <20230327171351.GA188288@sumitra.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Splitting function header to multiple lines because of 80 characters per
line limit, results in ending the function call line with '('.
This leads to CHECK reported by checkpatch.pl

Move the first parameter right after the '(' in the function call line.
Align the rest of the parameters to the opening parenthesis.

Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
---
 drivers/staging/rtl8192e/rtllib.h | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index c1b4e9e7c091..197c0a44ebd6 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1900,10 +1900,9 @@ struct net_device *alloc_rtllib(int sizeof_priv);
 
 /* rtllib_tx.c */
 
-int rtllib_encrypt_fragment(
-	struct rtllib_device *ieee,
-	struct sk_buff *frag,
-	int hdr_len);
+int rtllib_encrypt_fragment(struct rtllib_device *ieee,
+			    struct sk_buff *frag,
+			    int hdr_len);
 
 netdev_tx_t rtllib_xmit(struct sk_buff *skb,  struct net_device *dev);
 void rtllib_txb_free(struct rtllib_txb *txb);
-- 
2.25.1

