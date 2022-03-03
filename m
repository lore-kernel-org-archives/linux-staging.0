Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEB036B
	for <linux-staging@lists.linux.dev>; Thu,  3 Mar 2022 02:27:53 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id 15-20020a17090a098f00b001bef0376d5cso3547355pjo.5
        for <linux-staging@lists.linux.dev>; Wed, 02 Mar 2022 18:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=C6016/38QKZUQAyk5HMPjenTvm42Pe8sPBzTcqL5vmY=;
        b=qBGtve+IuFrAkJa+gsN1WQjHRs2fvQkSK1D44BenBKAqsyswWIPF49CjeAw6Lc/Xiz
         7VY9uX10GWOeYOq3Roffx9lK59MGCnSnWmLkHD6Zz3XGADMqQbIXFAspvzlfyt7tl87F
         C44YITS/y0gKUKqqxM42VKL4jH/Xx4KasojD++jZOWXtcwkx1m//DlSoFwhQEbp4i/NS
         eGEaCL2abI9d2Qo/vgVE47lljuFHl9RIsYb9haWI9DYl1+oIMHXMK3O9uyeK26H4D1AX
         Jy4saNgfSyFkb5FP8pbKE6ds3BSqIpGBCoZu+qijzq/vfSl1dGYXTnehjmH9/ySByi+z
         BIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=C6016/38QKZUQAyk5HMPjenTvm42Pe8sPBzTcqL5vmY=;
        b=BOntsyn6tr9vr7gykb2MU0ZziPQZeFKzWTW489um+ftFqAphahTfLVWfJjlibJHvQA
         MmJXtsl/PQy2A4h4uZ8+TTBUKvO6a95ugALpskq+EoCcdsbIJdfPT03Inj8eh+4rXgyj
         wbA8UsCCymMbbDzueYm1rweuZVhcDhe2eiayxwt8hW65dS3mQ4qv7HqttNCc9j4gNpu1
         OEW2y5s0HA2o2fLRhgCx/t5NDuVqwc41U8odJpx6/mLl4VzapUPB/O1gM7/k7ga7PlE+
         352Udp6XLl2vhoDq34gYb9lm4EtN3roi3tATAlhYMiHl1ewet/3l4Wn2vj7Tb4HIRokf
         72CQ==
X-Gm-Message-State: AOAM5322ZD8Z59Ty3yoJShh1OB17ZvuoNBh2/iSUvSCxFYZ6geVqJVQi
	wW06lcf58hmBrOLY1zaqg24=
X-Google-Smtp-Source: ABdhPJwdGKGtPoJbq9KB0b78P8kOQOqlHazHAUCZQHvA6TzNHcldJErwW75BUHOqmaVxrll88UvLqQ==
X-Received: by 2002:a17:902:ec90:b0:151:a632:7ebb with SMTP id x16-20020a170902ec9000b00151a6327ebbmr1936164plg.154.1646274473191;
        Wed, 02 Mar 2022 18:27:53 -0800 (PST)
Received: from ubuntu.huawei.com ([119.3.119.19])
        by smtp.googlemail.com with ESMTPSA id d15-20020a17090ab30f00b001b8e65326b3sm359822pjr.9.2022.03.02.18.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 18:27:52 -0800 (PST)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: david.laight@aculab.com
Cc: akpm@linux-foundation.org,
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
	v9fs-developer@lists.sourceforge.net,
	xiam0nd.tong@gmail.com
Subject: RE: [PATCH 2/6] treewide: remove using list iterator after loop body as a ptr
Date: Thu,  3 Mar 2022 10:27:29 +0800
Message-Id: <20220303022729.9321-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <1077f17e50d34dc2bbfdf4e52a1cb2fd@AcuMS.aculab.com>
References: <1077f17e50d34dc2bbfdf4e52a1cb2fd@AcuMS.aculab.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

On Wed, 2 Mar 2022 14:04:06 +0000, David Laight
<David.Laight@ACULAB.COM> wrote:
> I think that it would be better to make any alternate loop macro
> just set the variable to NULL on the loop exit.
> That is easier to code for and the compiler might be persuaded to
> not redo the test.

No, that would lead to a NULL dereference.

The problem is the mis-use of iterator outside the loop on exit, and
the iterator will be the HEAD's container_of pointer which pointers
to a type-confused struct. Sidenote: The *mis-use* here refers to
mistakely access to other members of the struct, instead of the
list_head member which acutally is the valid HEAD.

IOW, you would dereference a (NULL + offset_of_member) address here.

Please remind me if i missed something, thanks.

> OTOH there may be alternative definitions that can be used to get
> the compiler (or other compiler-like tools) to detect broken code.
> Even if the definition can't possibly generate a working kerrnel.

The "list_for_each_entry_inside(pos, type, head, member)" way makes
the iterator invisiable outside the loop, and would be catched by
compiler if use-after-loop things happened.

Can you share your "alternative definitions" details? thanks!

--
Xiaomeng Tong
