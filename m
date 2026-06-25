Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C03A3BD643
	for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 06:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782367937; cv=none; b=HqddM1ADltSJjHUZmzC90QiKGmYZVNhVQSmLz1AzcfU1mReDKUPTv0jHmM6KIZfMXqyc2K4UWBlE4/xuIqhpdJ62nI51hlmh2yWbgK78EWJ60IR5n9nA+wsQJh8IuCr2DyoO9DltYImETbdJ5PbubC9KdoXAqLhKerfIQh5NWPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782367937; c=relaxed/simple;
	bh=P3wSdOs9y+eKDNUGHdyX0nMcBBXpo7BwtGlIiU6XckA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dCSm/nrvCD95G8vicifflLgwyivw7WRUBvPofsPwQ4Y4Z9x75GAtM9tg0jiGjtMy48KoqnaXL4WefuDtx/5J/tXH+LFHYdVCC9OTMb9hQlIXEA233b51M33H8NBWWODB5SbWxZfEBR699SAREVL412oYbSyZKaJDo6R3AykxiwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowABXrtG6xjxqe6woFQ--.9004S2;
	Thu, 25 Jun 2026 14:12:10 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [RFC] staging: greybus: arche still depends on missing USB3613 provider
Date: Thu, 25 Jun 2026 14:12:08 +0800
Message-ID: <20260625061208.30279-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowABXrtG6xjxqe6woFQ--.9004S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtw4rXrW5GF1UXryDKr1fCrg_yoWktwc_Kw
	40qa48G3yjvrWqy3W2gFsxA3s8Wayqvr4rZry0v3y2k34fZFZxGF4q9FyfArZ7Ga45XFn5
	Wrs3Z347C343CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb4xFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1l
	IxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUSLvNUUU
	UU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

Hi,

while auditing conditional provider/header contracts, I noticed that Greybus
Arche still appears to describe a USB3613 provider world that is absent from
current mainline.

drivers/staging/greybus/Kconfig still has:

depends on USB_HSIC_USB3613 || COMPILE_TEST

and drivers/staging/greybus/arche-platform.c still conditionally includes
the USB3613 header and calls usb3613_hub_mode_ctrl() when
CONFIG_USB_HSIC_USB3613 is enabled.  However, the current tree does not appear
to provide include/linux/usb/usb3613.h or a Kconfig provider for
USB_HSIC_USB3613.

I am not sending a patch yet because this is staging/hardware policy sensitive.
The possible directions seem to be:

1. restore or move the USB3613 provider/header if the hardware path is still
   intended;
2. remove the stale USB3613 integration path and rely on the local stub;
3. change the Kconfig dependency to describe only current supported worlds; or
4. keep the contract if an out-of-tree provider is intentionally expected.

Could you advise which direction is expected for Arche?

This is static source/Kconfig/header analysis only.  I have not tested Arche
hardware.

Thanks,
Pengpeng

