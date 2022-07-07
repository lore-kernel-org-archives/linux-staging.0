Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD86828F2
	for <linux-staging@lists.linux.dev>; Thu,  7 Jul 2022 20:07:37 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id a5so13122805wrx.12
        for <linux-staging@lists.linux.dev>; Thu, 07 Jul 2022 13:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UFb/vVTHpa3YmcpTqh1lfRYgalrYlOtPO+3lLKx7e2w=;
        b=GRVmiFJd3x6IvVxVUAvexPqEe1BIH/ydII5rQVpCfECXWFdDLVbC0CkVpi3URstvFx
         SIIkJbBtkW5kyU/4SQszTwmD/+FayV+yCJTniXICKSLR+xkzwl/o6sn+6ciOjpfkv5U9
         iaWwNYSQFK41TalfJNN6/fTwGAgmqkOWoXAcaQRC4MijpK+qK+7d8/A7xwBxnw8TEe/C
         fC4GX9lTrLRiHcWYw2IJk5pqRpJWq6RGaY00V4Icb/eu5r/80qkqrIvaA/IOTDFBJdNc
         e8IagkcRYVqASRasxb/qGS+8V4J+6xLmJ/oNyIj3hb7iqcLQivDQwDZp1HsFMn/ERPFQ
         sL+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UFb/vVTHpa3YmcpTqh1lfRYgalrYlOtPO+3lLKx7e2w=;
        b=CcqsGwFFoMl/Y9QiruOrwl5m+CElRb9t4h2kPXpFSRk5yAEWlz5jJIQ46ypQwSsacM
         5uOwx6hbRwNObnvjevPqVbfRU8dX1GgFugBtIEZNn+jfOfVDain4VrXOQ7dhT5TYbtDW
         KkKDSXIGy33bRgRJja5aEA4K2ash+MiAFfKcDyMlMjA715CCdunFaCRZLrIBS0o0gur5
         /mXsK8ahomZqXlXSn8/drlfYRPVPlE0APxqHZ9m7EKuY9hCk1SJZjjYA4leRHM03N90I
         UtORYizXm7tMtDIpaWLMjcgWmZp41pu4xe27tARdxQSnUocCV6yquZRfOy2ceizyBHvC
         vrNA==
X-Gm-Message-State: AJIora8QIrkkYfLwZnK48Fs3kbk8SqUy/QTV15kQHByhNMHbSwuo/0Lo
	9fu4DtTDEOX/VeQECYHu1e0=
X-Google-Smtp-Source: AGRyM1uVn2DUfu47zHuV+A0ZwIoNSEY3jvQTT71rKq6YEHsh99Q9rdGTiuSk3+fVCiwUR87mDnXbxw==
X-Received: by 2002:adf:f646:0:b0:21d:7000:95b1 with SMTP id x6-20020adff646000000b0021d700095b1mr17651897wrp.486.1657224455913;
        Thu, 07 Jul 2022 13:07:35 -0700 (PDT)
Received: from localhost.localdomain (host-79-53-109-127.retail.telecomitalia.it. [79.53.109.127])
        by smtp.gmail.com with ESMTPSA id n17-20020a05600c3b9100b0039ee391a024sm25096752wms.14.2022.07.07.13.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 13:07:34 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Martiros Shakhzadyan <vrzh@vrzh.net>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ira Weiny <ira.weiny@intel.com>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [RESEND PATCH 0/3] staging: media: atomisp: Convert to kmap_local_page()
Date: Thu,  7 Jul 2022 22:07:15 +0200
Message-Id: <20220707200718.26398-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.36.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After waiting months, I'm resending three conversions to
kmap_local_page(). I'd like to ask if there is anything which prevents
these patches from being accepted.

Please note that these patches were submitted on April 2022.

For you convenience here are the links to the patches, the "Reviewed-by:" 
and "Tested-by:" tags:

[PATCH] staging: media: atomisp: Use kmap_local_page() in hmm_store()
https://lore.kernel.org/lkml/20220413225531.9425-1-fmdefrancesco@gmail.com/
https://lore.kernel.org/lkml/Yli+R7iLZKqO8kVP@iweiny-desk3/
https://lore.kernel.org/lkml/2d096f20-dbaa-1d49-96e9-a7ae6c19f7fe@redhat.com/

[PATCH] staging: media: atomisp: Use kmap_local_page() in hmm_set()
https://lore.kernel.org/lkml/20220413212210.18494-1-fmdefrancesco@gmail.com/
https://lore.kernel.org/lkml/YldNhErgt53RqYp7@iweiny-desk3/
https://lore.kernel.org/lkml/0b04ad1a-e442-1728-ef2c-bab386a4c64c@redhat.com/

[PATCH] staging: media: atomisp: Convert kmap() to kmap_local_page()
https://lore.kernel.org/lkml/20220408223129.3844-1-fmdefrancesco@gmail.com/
https://lore.kernel.org/lkml/b0aed731-b56f-4378-b50e-fc0cbccbdb84@redhat.com/

Fabio M. De Francesco (3):
  staging: media: atomisp: Convert kmap() to kmap_local_page()
  staging: media: atomisp: Use kmap_local_page() in hmm_set()
  staging: media: atomisp: Use kmap_local_page() in hmm_store()

 drivers/staging/media/atomisp/pci/hmm/hmm.c | 22 ++++++---------------
 1 file changed, 6 insertions(+), 16 deletions(-)

-- 
2.36.1

