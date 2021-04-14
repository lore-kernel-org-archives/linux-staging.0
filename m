Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B1E6D13
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 14:06:10 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id b139so16068342qkc.10
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 07:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=24C4YPPmvpQq0WpQR0fbdbp9ZiV7j5vDcMjzvvE1mNk=;
        b=uBrTXX9Zjwe3GGx4+r+nd5zq18AbmlA/vprUL1ffl6e5521M0Khm/LR9QaX+SQdOop
         IE00povsaMQW7lrQKqzg32f1hno2HBrxx1hijK+5dl46EwqMBNJg4ckqw9W7V9HRIHCA
         fsJIuoFvSrqBVoXsubEVIc5d+8IMGJG3vNENDPpjjFkT1YcuHYYy3EInYyczsOsT8o7F
         ngqET7waO9GGkZNpkAS/I6TwjOL4kKb4/EC9+p0kI41mvqabdR5kspUivquVMRaX4Ezd
         UalhTACn0GTdU5/mKk+a/wHJTZqhPzb6vtQPAP3R2VJESiKskPwi+L0PetpIK9OFajW/
         o4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=24C4YPPmvpQq0WpQR0fbdbp9ZiV7j5vDcMjzvvE1mNk=;
        b=g3WcuwAIAOetYNBHZPMLvthBXNEyZdNLGyABhlCHiTWQE38lu+W0c059/g8cRb6IY9
         VXJMS79b+DUVj3qCTRUBCzrwjgQeoVjM/FV/ozlOKvD4A0wNuHVWRFSiiGBdMlw9ORBg
         OjJpMrLK7JYc24ur2Uiev4u6/aGI5gxnHV8D9duFtmHK9byn4ZP27oWcYLw1I3KL0eoT
         wgfmpqVzGem2rAzB1qUPVLZrJgir+T7gJ3BROMeU18JOG2jU/YzI3KEuB5mk3MzGBQup
         caQPCyXUeXqEozB1pUc8jmeMBbL+rw12vDTglB7KQeEN2p6JG39k8quxwXRP86TJhuir
         pHcQ==
X-Gm-Message-State: AOAM532AYWgKTWj9cwHkmpyEfRFi2MPqik3cVG1jysMcvhY5JUV55hDy
	fea2UWDnz2J768yyTE97QAo=
X-Google-Smtp-Source: ABdhPJz0YLmFaj8lbliQzWO++Oj3bm/NtRjyADbV+kCcQnuBIbmXmHmReHgD6A2sdRpWL+o0a+EE+g==
X-Received: by 2002:a37:611:: with SMTP id 17mr22627564qkg.206.1618409169418;
        Wed, 14 Apr 2021 07:06:09 -0700 (PDT)
Received: from focaruja ([2001:1284:f016:a037:7038:c088:ae60:452d])
        by smtp.gmail.com with ESMTPSA id l16sm7420069qtr.65.2021.04.14.07.06.08
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Wed, 14 Apr 2021 07:06:09 -0700 (PDT)
Date: Wed, 14 Apr 2021 11:06:06 -0300
From: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [PATCH 2/2] staging: media: atomisp: pci: Correct identation in
 block of conditional statements in file atomisp_acc.c
Message-ID: <dd0b898b26f1bcc6563b7ed33670c801c0d4988f.1618409028.git.alinesantanacordeiro@gmail.com>
References: <cover.1618409028.git.alinesantanacordeiro@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618409028.git.alinesantanacordeiro@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)

Correct identation in block of conditional statements.
The conditional statement depends on the results of the
macro function "list_for_each_entry()".

Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_acc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_acc.c b/drivers/staging/media/atomisp/pci/atomisp_acc.c
index f638d0b..5e5faa4 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_acc.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_acc.c
@@ -77,8 +77,8 @@ acc_get_fw(struct atomisp_sub_device *asd, unsigned int handle)
 	struct atomisp_acc_fw *acc_fw;
 
 	list_for_each_entry(acc_fw, &asd->acc.fw, list)
-	if (acc_fw->handle == handle)
-		return acc_fw;
+		if (acc_fw->handle == handle)
+			return acc_fw;
 
 	return NULL;
 }
-- 
2.7.4

