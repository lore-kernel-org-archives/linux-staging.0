Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7AE2F3C1D
	for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 15:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769786950; cv=none; b=lS9gcbtBzq10CrD+FCk+CW01jCgqEBRvbgf8m5MH3CJoH3je4+r+ceV8cAuq8zvtK6GbuXqQ7fURuHBlrlMmIf0OUnCFFZVDDTNYCoLh5iw0Df8RV7DOeKnU+4u/Mu3eQsy9JUd5IQDyMmgQVTmtBRK4iZH6rYyUKbvO9RR/Yvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769786950; c=relaxed/simple;
	bh=5ZgUaAF9iNgoML7Qc29CrTODzvgzuTVSF2bB4q5IyFw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=k9WIAXGMp8uGcS4/GGCZrnxjaiTV/lvhIVQAa6+hlFchqB4fzwmfMgzy+vHiSHqqcyavUzGxyTM4AuYQjq75I3lO0iIQH4qRzJlCuM5/CvhMrNEYR5U0oai+Ej4aTbPWAubRbZJpkx1tvnWjTC9IhCsatNUz2fs1PQLJ60dbLds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DV7m6Rnk; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DV7m6Rnk"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b8707005183so335100166b.0
        for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 07:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769786947; x=1770391747; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kKsGSVs9HgJgiM9uYG4RRpRUVIdzeoi/1Scz/zV4Tjs=;
        b=DV7m6Rnk2odK8tp84agm6f+OJlpRRB8fChwAkrg1413kmA8XOVz00/NKeP++F4xC01
         MA049lS5NETdjhfP4DhZ0zRV4fiZ8EhwaElLh12sYRI7fGGVhxQstI5xbQQAKyvBuvKy
         CY4qrsz96KOPmrUsTzTJwFllqCBLxx8rEXfgNIGsM4MIgmkklwbsfEWmjdAapPNgfHM2
         XHjq2GQV0YMTp7LvyCViVwz3LD6tOyaG6Vz8mGoRAxf/PMc3a/52Dfzdp6E/O5p2b5ni
         OPr2OgcsFJBD49E6LMbVL3FM+MjMJKKxIDzxTpiiCwHZ+EjnkFyY7Q/EGk2oqwiNIUt4
         bvwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769786947; x=1770391747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kKsGSVs9HgJgiM9uYG4RRpRUVIdzeoi/1Scz/zV4Tjs=;
        b=jR4KJSrMyyTdK0Wg4x6ANDoBIWLE5JQaywpl8lhAoHGiz+DIlh1a1qVAmNMAKcxzto
         /TkAcTc65Gs6pPhEAoIqZDRH2zChwKbOfKbX0Z9r3KFtBnI4wdfbOQ8laQSqqxd7duxO
         wgyNVbAnjL2cZaxpu+GR2Uu5+oAWlJqX0EHkE4zwgkQrXrGKQ/xTrEg0FSowRaQ/OSBF
         WFjRaVk2tQ6PnQ40dMKO4JcZFEqtH40UVhowqlMbArmZBvUpOvhCKe4FeYCXzs9Dapq0
         IW34LW/Sui4aPJCJunhz4m2XS+iPL6PBWVaylqySsSTxc8UVLWTbrrpzlKn1ETK2sE4S
         WJzg==
X-Gm-Message-State: AOJu0Yz6TVR4tUJJevpN2jlIoQjTIQFNI+SqfeTiGSvtZ6c8FNg58x/N
	ImhjqG9U1w5U2iEf2jydXS9Z87CJirX2DXgDEcQKGptCbtRSt2CiqyNQ
X-Gm-Gg: AZuq6aJkV0ADmlYIgXg6hnQdKWOASfrCqFLuOvzhZrW5zVpCNF3zgBy1gvHMxlTrkAA
	EBTquO/GW5Qy7lXSPdVIN9+BpG1911uagnemiBv3TqNsTYmxySKXUH0fV+tBD2q+HSUI5jShjxh
	aPPKKrDV7mHgZo4tvkEqLPYquwL8OsjeGg8Jy4HlmsqTH1m+0S9k800na3PWPVQ8J+b3l/9iBDI
	eQ3+8ue2aabuL/quqBhbuuD7tL+qGN86zkHzjfdanb2bGDNQj4+mFcOWGeGQ0F/2QfYg67DwQTe
	lMUcyc4DUJTRT9pqDOTJ5jCfutdqpLrjfl0RYt9kZ+y+e4pICQ5gScihqgmWNKXa7ZYfdxif1Zb
	2wkL6pFr0XaTT8dcxhi32NK+5wAK+571lOkvqamuYdEniyFRmomvdzAq42QHZ17TT+DOCkqTyfG
	0wTZtSgMk+BF2osQ==
X-Received: by 2002:a17:906:dc92:b0:b86:e938:1b3a with SMTP id a640c23a62f3a-b8dff53de9dmr168833266b.17.1769786947125;
        Fri, 30 Jan 2026 07:29:07 -0800 (PST)
Received: from fedora ([146.70.126.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbeffed15sm430285966b.31.2026.01.30.07.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 07:29:06 -0800 (PST)
From: =?UTF-8?q?Filippo=20Muscher=C3=A0?= <filippo.muschera@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Filippo=20Muscher=C3=A0?= <filippo.muschera@gmail.com>
Subject: [PATCH] staging: vme_user: add identifier names to function prototypes
Date: Fri, 30 Jan 2026 16:28:07 +0100
Message-ID: <20260130152807.111025-1-filippo.muschera@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix checkpatch warnings:
WARNING: function definition argument '...' should also have an identifier name

Add parameter names to function prototypes in vme.h to match
their implementation in the source files.

Signed-off-by: Filippo Muscherà <filippo.muschera@gmail.com>
---
 drivers/staging/vme_user/vme.h | 121 ++++++++++++++++++---------------
 1 file changed, 67 insertions(+), 54 deletions(-)

diff --git a/drivers/staging/vme_user/vme.h b/drivers/staging/vme_user/vme.h
index 7753e736f9fd..97e3aa8a677c 100644
--- a/drivers/staging/vme_user/vme.h
+++ b/drivers/staging/vme_user/vme.h
@@ -121,69 +121,82 @@ struct vme_dev {
  */
 struct vme_driver {
 	const char *name;
-	int (*match)(struct vme_dev *);
-	int (*probe)(struct vme_dev *);
-	void (*remove)(struct vme_dev *);
+	int (*match)(struct vme_dev *vdev);
+	int (*probe)(struct vme_dev *vdev);
+	void (*remove)(struct vme_dev *vdev);
 	struct device_driver driver;
 	struct list_head devices;
 };
 
-void *vme_alloc_consistent(struct vme_resource *, size_t, dma_addr_t *);
-void vme_free_consistent(struct vme_resource *, size_t,  void *, dma_addr_t);
+void *vme_alloc_consistent(struct vme_resource *resource, size_t size,
+			   dma_addr_t *dma);
+void vme_free_consistent(struct vme_resource *resource, size_t size,
+			 void *vaddr, dma_addr_t dma);
 
-size_t vme_get_size(struct vme_resource *);
+size_t vme_get_size(struct vme_resource *resource);
 int vme_check_window(struct vme_bridge *bridge, u32 aspace,
 		     unsigned long long vme_base, unsigned long long size);
 
-struct vme_resource *vme_slave_request(struct vme_dev *, u32, u32);
-int vme_slave_set(struct vme_resource *, int, unsigned long long,
-		  unsigned long long, dma_addr_t, u32, u32);
-int vme_slave_get(struct vme_resource *, int *, unsigned long long *,
-		  unsigned long long *, dma_addr_t *, u32 *, u32 *);
-void vme_slave_free(struct vme_resource *);
-
-struct vme_resource *vme_master_request(struct vme_dev *, u32, u32, u32);
-int vme_master_set(struct vme_resource *, int, unsigned long long,
-		   unsigned long long, u32, u32, u32);
-int vme_master_get(struct vme_resource *, int *, unsigned long long *,
-		   unsigned long long *, u32 *, u32 *, u32 *);
-ssize_t vme_master_read(struct vme_resource *, void *, size_t, loff_t);
-ssize_t vme_master_write(struct vme_resource *, void *, size_t, loff_t);
-unsigned int vme_master_rmw(struct vme_resource *, unsigned int, unsigned int,
-			    unsigned int, loff_t);
+struct vme_resource *vme_slave_request(struct vme_dev *vdev, u32 address, u32 cycle);
+int vme_slave_set(struct vme_resource *resource, int enabled,
+		  unsigned long long vme_base, unsigned long long size,
+		  dma_addr_t buf_base, u32 aspace, u32 cycle);
+int vme_slave_get(struct vme_resource *resource, int *enabled,
+		  unsigned long long *vme_base, unsigned long long *size,
+		  dma_addr_t *buf_base, u32 *aspace, u32 *cycle);
+void vme_slave_free(struct vme_resource *resource);
+
+struct vme_resource *vme_master_request(struct vme_dev *vdev, u32 address,
+					u32 cycle, u32 dwidth);
+int vme_master_set(struct vme_resource *resource, int enabled,
+		   unsigned long long vme_base, unsigned long long size,
+		   u32 aspace, u32 cycle, u32 dwidth);
+int vme_master_get(struct vme_resource *resource, int *enabled,
+		   unsigned long long *vme_base, unsigned long long *size,
+		   u32 *aspace, u32 *cycle, u32 *dwidth);
+ssize_t vme_master_read(struct vme_resource *resource, void *buf, size_t count,
+			loff_t offset);
+ssize_t vme_master_write(struct vme_resource *resource, void *buf,
+			 size_t count, loff_t offset);
+unsigned int vme_master_rmw(struct vme_resource *resource, unsigned int mask,
+			    unsigned int compare, unsigned int swap, loff_t offset);
 int vme_master_mmap(struct vme_resource *resource, struct vm_area_struct *vma);
-void vme_master_free(struct vme_resource *);
-
-struct vme_resource *vme_dma_request(struct vme_dev *, u32);
-struct vme_dma_list *vme_new_dma_list(struct vme_resource *);
-struct vme_dma_attr *vme_dma_pattern_attribute(u32, u32);
-struct vme_dma_attr *vme_dma_pci_attribute(dma_addr_t);
-struct vme_dma_attr *vme_dma_vme_attribute(unsigned long long, u32, u32, u32);
-void vme_dma_free_attribute(struct vme_dma_attr *);
-int vme_dma_list_add(struct vme_dma_list *, struct vme_dma_attr *,
-		     struct vme_dma_attr *, size_t);
-int vme_dma_list_exec(struct vme_dma_list *);
-int vme_dma_list_free(struct vme_dma_list *);
-int vme_dma_free(struct vme_resource *);
-
-int vme_irq_request(struct vme_dev *, int, int,
-		    void (*callback)(int, int, void *), void *);
-void vme_irq_free(struct vme_dev *, int, int);
-int vme_irq_generate(struct vme_dev *, int, int);
-
-struct vme_resource *vme_lm_request(struct vme_dev *);
-int vme_lm_count(struct vme_resource *);
-int vme_lm_set(struct vme_resource *, unsigned long long, u32, u32);
-int vme_lm_get(struct vme_resource *, unsigned long long *, u32 *, u32 *);
-int vme_lm_attach(struct vme_resource *, int, void (*callback)(void *), void *);
-int vme_lm_detach(struct vme_resource *, int);
-void vme_lm_free(struct vme_resource *);
-
-int vme_slot_num(struct vme_dev *);
-int vme_bus_num(struct vme_dev *);
-
-int vme_register_driver(struct vme_driver *, unsigned int);
-void vme_unregister_driver(struct vme_driver *);
+void vme_master_free(struct vme_resource *resource);
+
+struct vme_resource *vme_dma_request(struct vme_dev *vdev, u32 route);
+struct vme_dma_list *vme_new_dma_list(struct vme_resource *resource);
+struct vme_dma_attr *vme_dma_pattern_attribute(u32 pattern, u32 type);
+struct vme_dma_attr *vme_dma_pci_attribute(dma_addr_t address);
+struct vme_dma_attr *vme_dma_vme_attribute(unsigned long long address,
+					   u32 aspace, u32 cycle, u32 dwidth);
+void vme_dma_free_attribute(struct vme_dma_attr *attributes);
+int vme_dma_list_add(struct vme_dma_list *list, struct vme_dma_attr *src,
+		     struct vme_dma_attr *dest, size_t count);
+int vme_dma_list_exec(struct vme_dma_list *list);
+int vme_dma_list_free(struct vme_dma_list *list);
+int vme_dma_free(struct vme_resource *resource);
+
+int vme_irq_request(struct vme_dev *vdev, int level, int statid,
+		    void (*callback)(int, int, void *), void *priv_data);
+void vme_irq_free(struct vme_dev *vdev, int level, int statid);
+int vme_irq_generate(struct vme_dev *vdev, int level, int statid);
+
+struct vme_resource *vme_lm_request(struct vme_dev *vdev);
+int vme_lm_count(struct vme_resource *resource);
+int vme_lm_set(struct vme_resource *resource, unsigned long long lm_base,
+	       u32 aspace, u32 cycle);
+int vme_lm_get(struct vme_resource *resource, unsigned long long *lm_base,
+	       u32 *aspace, u32 *cycle);
+int vme_lm_attach(struct vme_resource *resource, int monitor,
+		  void (*callback)(void *), void *data);
+int vme_lm_detach(struct vme_resource *resource, int monitor);
+void vme_lm_free(struct vme_resource *resource);
+
+int vme_slot_num(struct vme_dev *vdev);
+int vme_bus_num(struct vme_dev *vdev);
+
+int vme_register_driver(struct vme_driver *drv, unsigned int ndevs);
+void vme_unregister_driver(struct vme_driver *drv);
 
 #endif /* _VME_H_ */
 
-- 
2.52.0

