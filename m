Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D0A3812E9
	for <linux-staging@lists.linux.dev>; Wed, 19 Aug 2026 13:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787145697; cv=none; b=IeUPWx/XXBTrhoXBPvE99Nls6XrMcFIYhkhs93QFVA9A+cKncanwOGOEd2woJ2SHfk5d43Sxp1i15bhqGrfTSLJJMmL10PTLAN3rjiTviJd44PjgTjA4x4Htv32lHe9xT4gF+NAwrLJPpFFAAl4OouALMw7jJVd9XguPSta2Vps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787145697; c=relaxed/simple;
	bh=rQj849OsRmd2kQuYRCH1OxAAOvS4NcT5sYFAGT1SIXM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N2E0g6expEr27Z9swEzUEPNXgTEtDu0pJwmmbtj7mKa/PAzs5d29A4p6Zg9MO6AC4GGfbdb1O7m/PGfKag0sZaS0nZS2z4odEo2DK1Y7lynyXCUoeyflL6BZ0QLisEACUf0o0XgAo6k7vVL3pl+GZtBLHgAte7ITeiBPIUzC8DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=EXofGwA+; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="EXofGwA+"
Received: from PC-202605011814.localdomain (unknown [58.241.16.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4a92f1988;
	Wed, 19 Aug 2026 21:21:19 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Kris Huang <huang_kris@projectara.com>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: light: initialize channel lock before registration
Date: Wed, 19 Aug 2026 21:21:08 +0800
Message-Id: <20260819132108.17767-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2026081928-calzone-managing-4141@gregkh>
References: <20260818142020.1989539-1-runyu.xiao@seu.edu.cn> <2026081801-arguable-gosling-c590@gregkh> <ANAASQBEK9Ye2X-O4oze*arv.3.1787142765226.Hmail.220255722@seu.edu.cn> <2026081928-calzone-managing-4141@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa01a2ef38d03a1kunm4526a9f713f899
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaSB8fVh0YSRofHx4ZSx1JHlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZT0tIVUJCSU5LVU
	pLS1VKQktCWQY+
DKIM-Signature: a=rsa-sha256;
	b=EXofGwA+YVPzAspxWre8SQrUnuIYyKbbR2qAiQvwEIo53jaDr/eeUq29qzqIoA0F7vROLhfG1o8zGr+Eilfgg5qYueUFNy4oWgin/vMvqP7tv2XPd9l9UQldqpJRqHqgT2Dz7cvProH3fk/KRomJbKB6E8XTvJ543hQspQ5BfhY=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=xd2IAdW7APRb3gqJoQRKAS51juaf2cR4EPgk4SQzM/s=;
	h=date:mime-version:subject:message-id:from;

You're right, and "tested" was the wrong word in my reply.

The finding here is from code inspection, not from a runtime test. The
path I checked is:

  gb_lights_channel_register()
    -> led_classdev_register()
       publishes cdev->brightness_set_blocking
       (= gb_brightness_set()
          -> __gb_lights_brightness_set()
          -> __gb_lights_led_brightness_set()
          -> mutex_lock(&channel->lock))

but mutex_init(&channel->lock) only runs after
gb_lights_channel_register() returns, and that is the only place where
channel->lock is initialized. So the lock is published before it is
initialized.

The QEMU module I mentioned does not exercise this driver. It only shows
that taking an uninitialized mutex triggers the expected
DEBUG_LOCKS_WARN_ON(lock->magic != lock), so I should not have described
it as driver testing or as a reproducer for this driver.

And yes, 6.1.66 was only the kernel version in that local QEMU setup. The
patch itself was made and compile-checked against current mainline, and
I'll keep validation against mainline for future submissions.

The initial report came from PatchProof, a static-analysis pipeline I am
building for lock-API misuse. It flagged this publish-before-init ordering,
and I then manually verified the call path above. I did use an LLM as an
assistant during the workflow, but the finding itself was from the checker
and the patch I sent was based on my manual review of the code.

Thanks,
Runyu Xiao
