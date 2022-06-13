Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282521871
	for <linux-staging@lists.linux.dev>; Mon, 13 Jun 2022 19:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655149946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lRU/tXSNEI591tiyxCyAk8+677VSwnAsUAJG8lZmr/I=;
	b=U8GUF4owZQFdWvFr4B5X1uA4fI/1lamufiqlCpsuSSK96x3vY8pNdbMcqYL3ipFUXXx6Ax
	02UzTHhzyTaE50ol5G4EnEzRdbvY4NqrsVu5fQnGUn+Ob73BYrWyghz5jyadyUCpcZBsZW
	4Z8MVPBlxVYk5I1eILtDa+4jwkKBg7A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-2fsaztwPOdKkWQXZK4sAng-1; Mon, 13 Jun 2022 15:52:23 -0400
X-MC-Unique: 2fsaztwPOdKkWQXZK4sAng-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7ABE21C0513A;
	Mon, 13 Jun 2022 19:52:22 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.42])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EA43C2166B26;
	Mon, 13 Jun 2022 19:52:20 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>,
	andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 24/40] media: atomisp: drop unused ATOMISP_ACC_FW_LOAD_* defines
Date: Mon, 13 Jun 2022 21:51:21 +0200
Message-Id: <20220613195137.8117-25-hdegoede@redhat.com>
In-Reply-To: <20220613195137.8117-1-hdegoede@redhat.com>
References: <20220613195137.8117-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6

Drop the ATOMISP_ACC_FW_LOAD_* defines, these are no longer used anywhere.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/include/linux/atomisp.h    | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp.h b/drivers/staging/media/atomisp/include/linux/atomisp.h
index bf8af139647d..99348f677fa4 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp.h
@@ -825,18 +825,6 @@ struct atomisp_s_runmode {
 	__u32 mode;
 };
 
-#define ATOMISP_ACC_FW_LOAD_FL_PREVIEW		BIT(0)
-#define ATOMISP_ACC_FW_LOAD_FL_COPY		BIT(1)
-#define ATOMISP_ACC_FW_LOAD_FL_VIDEO		BIT(2)
-#define ATOMISP_ACC_FW_LOAD_FL_CAPTURE		BIT(3)
-#define ATOMISP_ACC_FW_LOAD_FL_ACC		BIT(4)
-#define ATOMISP_ACC_FW_LOAD_FL_ENABLE		BIT(16)
-
-#define ATOMISP_ACC_FW_LOAD_TYPE_NONE		0 /* Normal binary: don't use */
-#define ATOMISP_ACC_FW_LOAD_TYPE_OUTPUT		1 /* Stage on output */
-#define ATOMISP_ACC_FW_LOAD_TYPE_VIEWFINDER	2 /* Stage on viewfinder */
-#define ATOMISP_ACC_FW_LOAD_TYPE_STANDALONE	3 /* Stand-alone acceleration */
-
 #define ATOMISP_MAP_FLAG_NOFLUSH	0x0001	/* Do not flush cache */
 #define ATOMISP_MAP_FLAG_CACHED		0x0002	/* Enable cache */
 #define ATOMISP_MAP_FLAG_CLEARED	0x0004
-- 
2.36.0

