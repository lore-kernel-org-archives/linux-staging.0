Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C457E
	for <linux-staging@lists.linux.dev>; Fri,  9 Dec 2022 02:18:56 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id t11-20020a17090a024b00b0021932afece4so6602319pje.5
        for <linux-staging@lists.linux.dev>; Thu, 08 Dec 2022 18:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YP2JhvQ/nXbjiALnflrIMIPBw0fYLqdcvynpr/luaz4=;
        b=ShYb/nGmDFKeKcQhogFI+dsBzw/V1ttzvjMr4aRxdgwo9MDnai1pDK1eURpjYi2fJZ
         tSWE6dv5vyhz4Skq/SHYKVTnWYnEtecPQaYSzf6w8Fa52dhNAYcQDPzpoBLeuj/Hwmod
         QYTmBU8y/hdnD/a+iln4cqucW+qCdSk+HtHxP92VnjuCuqqsml3TRB0L5AMCcc/vHcLV
         No4ypahaipbq/zivtJ6WwVlb65GLPWeQroH2XIQ7DVNp3KNWyLSuHkaKaac4H090KUXo
         Yn2okwEY4iumYrZMMMWkDr/5SpsdjMXrfRYp9qmoqDnL8pYG24eUWRYQq3X8OHJ+C5xE
         i8yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YP2JhvQ/nXbjiALnflrIMIPBw0fYLqdcvynpr/luaz4=;
        b=vvW0Gy20H34b9+LPbkzAhGoNOEM9ynCCE3/I3aaP1odnDCKpU+lteZgsMhRl1haoQ4
         sJSzCFqhposeVbuF5k7S8IgPg0qFdfNigqaRFmxueNraBeHJhDzEaKMYFrIncpJG2v3S
         gpn2kpoOqELmKzZvBFDsICuAbhzxYRjkRXB/Pa8dyxeIPBMC3xb9eK6XsqVaNEK9Omgi
         bX6L5oZsZmlYUrIG3ws8oVXdEH0Uwcd97Nl95ATd7XfTlKGs3PtRxQ50/vMPwMlQ8Upu
         N0aT0Jo/EHTSsQRX/Zz6h+eQw2rQDPLqnepr5eGjr8UEgiVQSVgaTylBDJihiROoaFKs
         A6xw==
X-Gm-Message-State: ANoB5pluY5ASE4qsVxUW9MxTNzpuhwH4VwN0YUtQYhCVzKiAU5wh/QB5
	qoKVd/+8z+to/1GKuigs3kk=
X-Google-Smtp-Source: AA0mqf6EfTKaf56Mx2uMQ1tm5kYotOCc7W9e3xxXY8+PJQdooNECNmWH6SrWa4f+Hg+qFS5qxAWzZQ==
X-Received: by 2002:a05:6a20:94c8:b0:a4:6ce5:46e7 with SMTP id ht8-20020a056a2094c800b000a46ce546e7mr5892197pzb.10.1670552335610;
        Thu, 08 Dec 2022 18:18:55 -0800 (PST)
Received: from localhost.localdomain (2001-b400-e283-776d-8739-aa48-f251-9f2f.emome-ip6.hinet.net. [2001:b400:e283:776d:8739:aa48:f251:9f2f])
        by smtp.gmail.com with ESMTPSA id o16-20020a170902779000b0017f5ad327casm116249pll.103.2022.12.08.18.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 18:18:55 -0800 (PST)
From: Matt Jan <zoo868e@gmail.com>
To: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Matt Jan <zoo868e@gmail.com>
Subject: [PATCH v3 3/3] staging: vme_user: replace 'unsigned' with 'unsigned int'
Date: Fri,  9 Dec 2022 10:17:56 +0800
Message-Id: <20221209021756.5597-3-zoo868e@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221209021756.5597-1-zoo868e@gmail.com>
References: <20221209021756.5597-1-zoo868e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the bare use of "unsigned" to the preferred "unsigned int".

Signed-off-by: Matt Jan <zoo868e@gmail.com>
---

Changelog
v2->v3: Resend the patch set in properly threaded and move the patch
		changelog to correct position, noted by Greg Kroah-Hartman
		<gregkh@linuxfoundation.org>
v1->v2: Resend the correct patch set, noted by Greg Kroah-Hartman
		<gregkh@linuxfoundation.org>
		Align the comment correctly, noted by Dan Carpenter
		<error27@gmail.com>

 drivers/staging/vme_user/vme_bridge.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vme_user/vme_bridge.h b/drivers/staging/vme_user/vme_bridge.h
index 5da2643e20d5..11df0a5e7f7b 100644
--- a/drivers/staging/vme_user/vme_bridge.h
+++ b/drivers/staging/vme_user/vme_bridge.h
@@ -84,7 +84,7 @@ struct vme_error_handler {
 	unsigned long long end;		/* End of error window */
 	unsigned long long first_error;	/* Address of the first error */
 	u32 aspace;			/* Address space of error window*/
-	unsigned num_errors;		/* Number of errors */
+	unsigned int num_errors;	/* Number of errors */
 };
 
 struct vme_callback {
-- 
2.25.1

