Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA2518C931
	for <linux-staging@lists.linux.dev>; Wed,  9 Oct 2024 08:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728463040; cv=none; b=hvY6FhWPF0SnHbsgkFAfIalif+9p3QQKjnOyTNaC/lXH3rfIdOa7dffUDu9jSEDd2AHZnAX8ljPAu4hHfap0fDvf00Ez0i2asmb05mWS4+2GV7lz8C2xLLIXEqqjBhXg0LGQgaCdmLaZdLQA9edvKlZpkv+EWjZl2p6A8b1lWcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728463040; c=relaxed/simple;
	bh=NzW9wxcIHOJnLhCClKauHXIBaaQFN0Es8rifujb3cYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S70ywD814bjh6kxginCmFRMGzQmNR4HJvpGj3zesD2yr6vh+s2OnY3obnmqiZJEf6za1kFB4gJCKGPsd3krU7U/FAcgSyGoWAVvzL6ICjLmC7NaVbOlmJ/q7/xEcpe+vDjH2vNqOu0/gr3uf5nK5zO7tQyKAZHMb1Cnbl0JdU2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UjcAybwa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UjcAybwa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728463037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x2+4tkUVcLGJF5zHhr3G6hU1vXfnQU3y0JjqPGIiXBc=;
	b=UjcAybwaw2kqxM+UBdxnR9CoTvvYKZ4N7l4mTHfI2u34MhXIGTnbf3c+z2Mg/YO6MO5KAs
	L0uCX+oUeUkbBZwhsAaQ0/jTNZxU6xbG+4R1BBHjXZ/9moGyVxivOkpD5yK2pyZxtf/0fU
	0w+4ZhN+10nKwhJyz26svJnV4SRw8vA=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-J6p6NxNUOO6vlZC61TP7XQ-1; Wed, 09 Oct 2024 04:37:16 -0400
X-MC-Unique: J6p6NxNUOO6vlZC61TP7XQ-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7afdf50bfcaso139032485a.1
        for <linux-staging@lists.linux.dev>; Wed, 09 Oct 2024 01:37:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728463035; x=1729067835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x2+4tkUVcLGJF5zHhr3G6hU1vXfnQU3y0JjqPGIiXBc=;
        b=K5uut835X5u8Aw7uav3YKqe7wu1/MO9TxcmKXTl/dAm18krVBepovhudCuaGOTzwLh
         j4p1tVht3bLdrL/r/Xwk6cb0mtcpajEHTdlmGAG/OS0mr+kMMtpv6yF4INPWUf1d0RRQ
         rl7mf6gTDYkENCc+6v3+iEYaDnln6NbokSXZp/064zEJaSZyxKmRg+6+HFeOZkf+e9Hn
         fAsfkoNoqub1v2In84yEeh55b3m5jJtOeXkTI3uFfwCfBIr3QSKmECQ3bJK/U1OUeGD1
         ZhvCgDRmgTW/zMSre+6Al5NuXgqga0ZfmvSADfNqVQEBGMd55MfcvDXq0c6FYL2cl4N0
         f4aQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/b36Fjo6HZcjhLIEaIz97NniPk63OPMFrnjYr57dwmWbavd0lf1UPZyDhEDSdk/2jbTo5c3cEvRMy6GEG@lists.linux.dev
X-Gm-Message-State: AOJu0YyhEaVCwTfTTz8Wd62MowMhsXKVXo1nixTQKFW90ic4SRICduaz
	79Gg0DnpwULGe+9bLbPaK8fLMpNJS3sbxb2gKAg/OPP0tL8cURNq9Ah2nBwzHO3uPW+blZD0Rqw
	fWmx+w29T9MBhhHhSkt1j0E0cGzG2kAUJ9HuKQTJMDaxEM6AzdGRomDuI5QSr7ro=
X-Received: by 2002:a05:620a:2585:b0:7a1:e341:d543 with SMTP id af79cd13be357-7ae85f85358mr1004129085a.28.1728463035623;
        Wed, 09 Oct 2024 01:37:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEO+/SwmcH6h0Vxkc+UACkKjxSzn/5VgASgM8SukkUVixA4gIuWgHYKW5iFaezTFbfMq+Vx5w==
X-Received: by 2002:a05:620a:2585:b0:7a1:e341:d543 with SMTP id af79cd13be357-7ae85f85358mr1004126485a.28.1728463035252;
        Wed, 09 Oct 2024 01:37:15 -0700 (PDT)
Received: from eisenberg.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ae75615aa2sm439643585a.14.2024.10.09.01.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 01:37:15 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Basavaraj Natikar <basavaraj.natikar@amd.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alex Dubov <oakad@yahoo.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Manish Chopra <manishc@marvell.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rasesh Mody <rmody@marvell.com>,
	GR-Linux-NIC-Dev@marvell.com,
	Igor Mitsyanko <imitsyanko@quantenna.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Kalle Valo <kvalo@kernel.org>,
	Sanjay R Mehta <sanju.mehta@amd.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Jon Mason <jdmason@kudzu.us>,
	Dave Jiang <dave.jiang@intel.com>,
	Allen Hubbe <allenbh@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Philipp Stanner <pstanner@redhat.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Chen Ni <nichen@iscas.ac.cn>,
	Ricky Wu <ricky_wu@realtek.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Breno Leitao <leitao@debian.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mostafa Saleh <smostafa@google.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hannes Reinecke <hare@suse.de>,
	John Garry <john.g.garry@oracle.com>,
	Soumya Negi <soumya.negi97@gmail.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Yi Liu <yi.l.liu@intel.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Christian Brauner <brauner@kernel.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Eric Auger <eric.auger@redhat.com>,
	Ye Bin <yebin10@huawei.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Rui Salvaterra <rsalvaterra@gmail.com>,
	Marc Zyngier <maz@kernel.org>
Cc: linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ntb@lists.linux.dev,
	linux-pci@vger.kernel.org,
	linux-staging@lists.linux.dev,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-sound@vger.kernel.org
Subject: [RFC PATCH 04/13] net/ethernet: Use never-managed version of pci_intx()
Date: Wed,  9 Oct 2024 10:35:10 +0200
Message-ID: <20241009083519.10088-5-pstanner@redhat.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241009083519.10088-1-pstanner@redhat.com>
References: <20241009083519.10088-1-pstanner@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

pci_intx() is a hybrid function which can sometimes be managed through
devres. To remove this hybrid nature from pci_intx(), it is necessary to
port users to either an always-managed or a never-managed version.

broadcom/bnx2x and brocade/bna enable their PCI-Device with
pci_enable_device(). Thus, they need the never-managed version.

Replace pci_intx() with pci_intx_unmanaged().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c | 2 +-
 drivers/net/ethernet/brocade/bna/bnad.c          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
index 678829646cec..2ae63d6e6792 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
@@ -1669,7 +1669,7 @@ static void bnx2x_igu_int_enable(struct bnx2x *bp)
 	REG_WR(bp, IGU_REG_PF_CONFIGURATION, val);
 
 	if (val & IGU_PF_CONF_INT_LINE_EN)
-		pci_intx(bp->pdev, true);
+		pci_intx_unmanaged(bp->pdev, true);
 
 	barrier();
 
diff --git a/drivers/net/ethernet/brocade/bna/bnad.c b/drivers/net/ethernet/brocade/bna/bnad.c
index ece6f3b48327..2b37462d406e 100644
--- a/drivers/net/ethernet/brocade/bna/bnad.c
+++ b/drivers/net/ethernet/brocade/bna/bnad.c
@@ -2669,7 +2669,7 @@ bnad_enable_msix(struct bnad *bnad)
 		}
 	}
 
-	pci_intx(bnad->pcidev, 0);
+	pci_intx_unmanaged(bnad->pcidev, 0);
 
 	return;
 
-- 
2.46.1

