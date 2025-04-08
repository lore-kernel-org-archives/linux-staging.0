Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA47256C91
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 23:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744154746; cv=none; b=E/d1w9oUxYdcKqQuXSH14rgVRVcK+lLwAj63DaA9aAmfHXEatwxq7F+BPnFPmZH5BevI5X2zd4czqi53L+3bl6TvefDmla1wM88Fnyf3DjgftMP6DtjVayNKNV7185fr7nwd/ApH2j2Tj2o/66Wj3ECxTutZCda/bUcMi02wKpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744154746; c=relaxed/simple;
	bh=KLuwg37HA9d35p6YPDfUzR6m5Ve1w96Q9p2SqO1gqJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jzIgEOYM1UdCn23ITKBBEpyQiDs1IIBhMMjNnx8PLbqxgicA0exzyUPlEN/wT9NBjf54XBkt/+uCm3fhJ/iCJ76gN+Bl9HHPPWdWPElBAPg3FO5WLM5shnqeni+61xXnJJz74q+zCchFWQmSyX9QABslDZG+ktKFgDex+vLSBhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=QMG9JAQ7; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="QMG9JAQ7"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-af519c159a8so5554268a12.3
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 16:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744154741; x=1744759541; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P411XXh9tP6xKxZOeS+c/EGq9SgVAs4t8mf9P3YcEAY=;
        b=QMG9JAQ7HNPEwwj21Psj4StHwdd3JMJmbPK0GekZKuedQs1HdN+gIn/ixPY5FjVnqv
         C+lTm7tNjW918h071w/m1iAboVNYt5Y3v6iEjj5uxnxxsN5mBf1YUD69ZrOwWJJdIgsZ
         0BXwHWrtv3701JS6hsoO0tmoKJ0WDfSsYHx88zSoIHPD6RufRJdbSU33d53S5n58Umv/
         QvVEsdbHT7nvBQ9njsFCJy1biPgTl9yKRRwUOl8GHxD7aG9ZjCf2j/5xGWcQWa/04I7P
         XtVXTElHfJomGmiTxWrefu5AMezeLhWj3veVhIJsbhfqB3Do+pDnZJ69CnHDbE+4d9eG
         w5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744154741; x=1744759541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P411XXh9tP6xKxZOeS+c/EGq9SgVAs4t8mf9P3YcEAY=;
        b=g6tsGBEJgEY0oj2r68emidcYJpaaqOkr2hST8sTcqhqMOsIRHJo6/4XXTl1dALT66J
         MiwqDmTKEd/jtjDol+g49eZvUIgvYSZe7bV8AdFq1zZzyKtaIABXqCIfoY1iZqF37yh6
         WUJRMtwobqwynt+4PAc4EnQ7AfLIRYEkuVUJj/4cJ3BywDHfBtt1KzS9/vJB5QRBsTCc
         I0AJXw1mPKdWLnEibmtjy2YpPhzZnIMyI2+1HlvPJdT1gmMGCHHoXX5MqrW/w6d73V7F
         S14t/8puSkQ5xJCFnAhP6HiQQX7tctUs4PUcFdO+kXWFnDQVqPjdrOowHBOu2YE8n9B/
         xXRg==
X-Gm-Message-State: AOJu0Yy4o0R61o5ZCUg3I+puNAagkt+X4NLgQDyUHoPfwI3MqtEd5f9m
	1/dGddl0VO4YJ8nwlXbFWiF/XlrM2esmZAAWNYelgajzyMc2UNh9SClPNbAAlRHEn28TS8fVCBs
	=
X-Gm-Gg: ASbGncu647jpcrZ4lVzJ8vVXEjlWdfJsxwGvFYbKu+c9sy/OUB2Vf3O6zRSe/NyUs+p
	5UgtEA8OMTsZwA33vdaAPAtQPyFGO2+gQcXpzscsXx22genrpOKzog4UQnk4mLRdyXGgPGonFri
	wn0oENQ2RPJj5rLjXWbA1hJKMN5Po9VIqb7OxYa/NXklQEWmuepVwvaiBsE9NtQj6SZ5adq7Dza
	aO/cI3siZVGbwGQcKWKWKXVjXS899hrzT5y25U/Oedp+Rq/1pOBSfn0FQUmKI7sjZOMNvFeQ1kr
	L9Ht8/RU4W7Ot4ixsN6OTMx5P2Fst4CeMHO2kF9miDH1WkWR3Yw6Xcf3Q/5ikrlyb4jTMVYcpKH
	baGS+QK7xfw==
X-Google-Smtp-Source: AGHT+IF9ozNozcEFD4AY8UaNsfqRMujNJK7qdpQ0MPYPXtpgegTgLnYRb1rqoIe2L+hZrQFNYEqiiw==
X-Received: by 2002:a17:90b:56c6:b0:2fc:3264:3657 with SMTP id 98e67ed59e1d1-306dba63685mr1778738a91.0.1744154741086;
        Tue, 08 Apr 2025 16:25:41 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866cd1dsm106403815ad.159.2025.04.08.16.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 16:25:40 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 2/7] staging: gpib: Removing gpib_interface_list_t
Date: Tue,  8 Apr 2025 23:25:30 +0000
Message-ID: <20250408232535.187528-3-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408232535.187528-1-matchstick@neverthere.org>
References: <20250408232535.187528-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removing gpib_interface_list_t to adhere to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c     | 10 +++++-----
 drivers/staging/gpib/include/gpib_types.h |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 684faa0c4547..3fb369caf17e 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -826,9 +826,9 @@ static int board_type_ioctl(gpib_file_private_t *file_priv,
 
 	for (list_ptr = registered_drivers.next; list_ptr != &registered_drivers;
 	     list_ptr = list_ptr->next) {
-		gpib_interface_list_t *entry;
+		struct gpib_interface_list *entry;
 
-		entry = list_entry(list_ptr, gpib_interface_list_t, list);
+		entry = list_entry(list_ptr, struct gpib_interface_list, list);
 		if (strcmp(entry->interface->name, cmd.name) == 0) {
 			int i;
 			int had_module = file_priv->got_module;
@@ -2026,7 +2026,7 @@ void init_gpib_descriptor(gpib_descriptor_t *desc)
 
 int gpib_register_driver(struct gpib_interface *interface, struct module *provider_module)
 {
-	struct gpib_interface_list_struct *entry;
+	struct gpib_interface_list *entry;
 
 	entry = kmalloc(sizeof(*entry), GFP_KERNEL);
 	if (!entry)
@@ -2057,9 +2057,9 @@ void gpib_unregister_driver(struct gpib_interface *interface)
 		}
 	}
 	for (list_ptr = registered_drivers.next; list_ptr != &registered_drivers;) {
-		gpib_interface_list_t *entry;
+		struct gpib_interface_list *entry;
 
-		entry = list_entry(list_ptr, gpib_interface_list_t, list);
+		entry = list_entry(list_ptr, struct gpib_interface_list, list);
 		list_ptr = list_ptr->next;
 		if (entry->interface == interface) {
 			list_del(&entry->list);
diff --git a/drivers/staging/gpib/include/gpib_types.h b/drivers/staging/gpib/include/gpib_types.h
index 66a1a1676f2b..4be7cfce539f 100644
--- a/drivers/staging/gpib/include/gpib_types.h
+++ b/drivers/staging/gpib/include/gpib_types.h
@@ -209,11 +209,11 @@ static inline void init_gpib_pseudo_irq(struct gpib_pseudo_irq *pseudo_irq)
 }
 
 /* list so we can make a linked list of drivers */
-typedef struct gpib_interface_list_struct {
+struct gpib_interface_list {
 	struct list_head list;
 	struct gpib_interface *interface;
 	struct module *module;
-} gpib_interface_list_t;
+};
 
 /* One struct gpib_board is allocated for each physical board in the computer.
  * It provides storage for variables local to each board, and interface
-- 
2.43.0

