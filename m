Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A8D72
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 07:22:02 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id ot17-20020a17090b3b51b0290109c9ac3c34so12017568pjb.4
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 00:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fOZOvYrVPIcZPO2R1dW7gEMhF5gXoGLf+TJd7DF8ljo=;
        b=HRQJdPkhGjqRsB6YI0Jwx0K/h2FghIaw9XUDYBGZiew7aqo8R0m2+CwOrjpTpGgFMC
         S/srO2NNCgixWWUO7YixYFcQlf8oiduiBGx4n8LkDFwuL3+T/gTK3l8tijP8zio6TU7Y
         5uw1v3/yBHIqq1kKWXQMPkJA7SNKMboqbJ3tmcI7HCqi0InZB2ogDCb+4zJbrkZJU87h
         fUpoUQS8oWRB3DGalomq71SCS1uuBPudoMBaF71LbnDOne8pTYA6w9D0D+jekRTwZWUp
         f5m4MGhcXrGMqrLdjZ61cCpOGB/T7eTn8NLa0YGNPpucf6sUPhh0AnPQS9R65OU7xlcJ
         sOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fOZOvYrVPIcZPO2R1dW7gEMhF5gXoGLf+TJd7DF8ljo=;
        b=ExcLtsxhqsfAe05e/vaKsfskGlUnXwFa/wOcY4nE6jLv5nYD0A8MjbUQZNBU2aQjnM
         RXX1/LmKNq+1H7MJ4Vs1fzsNJI5iOHs2je26PBeqxFelE5vaE91QVDFD5CkX0SSrwZfa
         DGmGQ9+W2taDlTfzNRZ7phpUADEnW1M+NsLLCoAiIKQc3tBWRDGWFhyb5NTyP1YGU5FO
         fEcNUuTbNt66ZGIj6ie4rK8dwu9MS0ApBlNiil3CpgvfdRlBMu4oPLr0yBd7Jm3jWuO1
         YVPXbwBYokG7GlBavlbACmJJ+ZzIEXXmOEH/1rLQ1HBxKZvhmTAC6ol34HMFx7XBSS7c
         ms6g==
X-Gm-Message-State: AOAM532MzOmDVfFoHBh21lCAbNntlwwJPYry2JXSLnwYhb7k83Liqn52
	bRCRQ83B5iBJxQWnfc7bpkQ=
X-Google-Smtp-Source: ABdhPJwD9xA9TFfNPjtfquklFyJTiYrdUaPFWrmyRgn4DButJl6iWVYC5sH1H9fyuQ7hLtOoLnieyg==
X-Received: by 2002:a17:902:6bcc:b029:ea:f58f:274c with SMTP id m12-20020a1709026bccb02900eaf58f274cmr15518935plt.68.1618384921966;
        Wed, 14 Apr 2021 00:22:01 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id u1sm16135423pgg.11.2021.04.14.00.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 00:22:01 -0700 (PDT)
Date: Wed, 14 Apr 2021 12:51:55 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH v6 1/2] staging: rtl8192e: remove parentheses around boolean
 expression
Message-ID: <60483f646c16ffd3c19ca8f508a1f1c3a0a13db6.1618383684.git.mitaliborkar810@gmail.com>
References: <cover.1618383684.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618383684.git.mitaliborkar810@gmail.com>

Removed unnecessary parentheses around '!xyz' boolean expression as '!'
has higher precedance than '||'

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 
Changes from v5:- No changes.
Changes from v4:- No changes.
Changes from v3:- No changes.
Changes from v2:- Modified subject description. Changes has been made in
v3.
Changes from v1:- Removed unnecessary parentheses around boolean
expression. Changes has been made in v2.

 drivers/staging/rtl8192e/rtl819x_HTProc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index b1fa8e9a4f28..431202927036 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -276,7 +276,7 @@ void HTConstructCapabilityElement(struct rtllib_device *ieee, u8 *posHTCap,
 	struct rt_hi_throughput *pHT = ieee->pHTInfo;
 	struct ht_capab_ele *pCapELE = NULL;
 
-	if ((!posHTCap) || (!pHT)) {
+	if (!posHTCap || !pHT) {
 		netdev_warn(ieee->dev,
 			    "%s(): posHTCap and pHTInfo are null\n", __func__);
 		return;
-- 
2.30.2

