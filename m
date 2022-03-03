Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BBA7A
	for <linux-staging@lists.linux.dev>; Thu,  3 Mar 2022 08:38:55 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id 132so3922319pga.5
        for <linux-staging@lists.linux.dev>; Thu, 03 Mar 2022 00:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=SGMF6oSM44wO/3sji0yXCG/PEtOPShxdSQ68WLQRB2g=;
        b=ZvINIOlHF3nZHDcX3MwxAzlzprOUAV7bE6ys/MgPVlfVq9lkuahVjDHsPLQ7QbaFo9
         fQEFqUdMgi81YiKV62ulZnN7ZvbWazV6yRB1Qn/XiuQndMVO9fvHUymuPfTr2Dg+jh50
         vUEnvjC71yyLrdhZGmiVJ4PzTrzLKfXKpEMH9pkW4eVCRVAqTfa9XuvSN7zcx65Vy8CK
         d46NAYhkVq2HOhizng3Ws+JRbkWyYjQl4vq/u0RRAuHhPVUlG5PBN7oH7sIbE0gusQ26
         6C+XTV9PxP4Ds6jAKJQCAmbFUS0yNAc3zTUs7Z/QKxXKC+XQ8KtJ4GqninQZxzg5r19Q
         dsow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=SGMF6oSM44wO/3sji0yXCG/PEtOPShxdSQ68WLQRB2g=;
        b=S4aunzwVTc3+KJwHptigC6OpjBD1zJiCsIKOKJmtB0E4H4f0Ivhm8Ac/+CVirtLX3L
         sY2yGfrREqzJ//sxqUzPGZYoMfFvtZKOK8dORoECgIxusXgVvvjuteplPU/hN5in4hEl
         Nkaoe8PhML4HHYGMozrg1x1ugUuva12nVBCrPqZqR+Tbxqpio8k30uI4ySjDne5M+VjB
         Nldw3TocAV7OX0rp2Yk7Wtg/9B3KDH00jAAuyTVVy71JJgExpIl7+wOS6XNaoymkoyup
         6SCs5FgjQZXld1kHuQeN19M9Sj4FPOnDqPs5SUYpDk0Gt7SxHgKUGlhtX/kiAPZXkuem
         Rc1A==
X-Gm-Message-State: AOAM531AoBk/nDuGgQv0oa+msZObkMhmFaKwf54k3rsYUIpaddnjND5Z
	IpJYw9ORVj2/MnslcgJwNj4=
X-Google-Smtp-Source: ABdhPJxqu7M+1zWgFCPBx1x396RDv729JpxnE5pMePfUDpYTg5HqtDHmeV1ToBxB32C6BUNb5VRxjw==
X-Received: by 2002:a63:f03:0:b0:374:50b5:1432 with SMTP id e3-20020a630f03000000b0037450b51432mr28638188pgl.308.1646296735582;
        Thu, 03 Mar 2022 00:38:55 -0800 (PST)
Received: from ubuntu.huawei.com ([119.3.119.19])
        by smtp.googlemail.com with ESMTPSA id q92-20020a17090a1b6500b001bc169e26aasm6405436pjq.2.2022.03.03.00.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 00:38:54 -0800 (PST)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: xiam0nd.tong@gmail.com
Cc: David.Laight@ACULAB.COM,
	akpm@linux-foundation.org,
	alsa-devel@alsa-project.org,
	amd-gfx@lists.freedesktop.org,
	andriy.shevchenko@linux.intel.com,
	arnd@arndb.de,
	bcm-kernel-feedback-list@broadcom.com,
	bjohannesmeyer@gmail.com,
	c.giuffrida@vu.nl,
	christian.koenig@amd.com,
	christophe.jaillet@wanadoo.fr,
	dan.carpenter@oracle.com,
	dmaengine@vger.kernel.org,
	drbd-dev@lists.linbit.com,
	dri-devel@lists.freedesktop.org,
	gustavo@embeddedor.com,
	h.j.bos@vu.nl,
	intel-gfx@lists.freedesktop.org,
	intel-wired-lan@lists.osuosl.org,
	jakobkoschel@gmail.com,
	jgg@ziepe.ca,
	keescook@chromium.org,
	kgdb-bugreport@lists.sourceforge.net,
	kvm@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-block@vger.kernel.org,
	linux-cifs@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-fsdevel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-sgx@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux1394-devel@lists.sourceforge.net,
	linux@rasmusvillemoes.dk,
	linuxppc-dev@lists.ozlabs.org,
	nathan@kernel.org,
	netdev@vger.kernel.org,
	nouveau@lists.freedesktop.org,
	rppt@kernel.org,
	samba-technical@lists.samba.org,
	tglx@linutronix.de,
	tipc-discussion@lists.sourceforge.net,
	torvalds@linux-foundation.org,
	v9fs-developer@lists.sourceforge.net
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body as a ptr
Date: Thu,  3 Mar 2022 16:38:31 +0800
Message-Id: <20220303083831.11833-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220303083007.11640-1-xiam0nd.tong@gmail.com>
References: <20220303083007.11640-1-xiam0nd.tong@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

correct for typo:

-for (struct list_head *list = head->next, cond = (struct list_head *)-1; cond == (struct list_head *)-1; cond = NULL) \
+for (struct list_head *list = head->next, *cond = (struct list_head *)-1; cond == (struct list_head *)-1; cond = NULL) \

--
Xiaomeng Tong
