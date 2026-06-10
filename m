Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73402E2DFB;
	Wed, 10 Jun 2026 22:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781129962; cv=none; b=KI3xo5h5BwwIXqsAWs41vlmsVjsWtbnpG7GM2Yc+9Ksph9ofLGxo+4L0VSGCYcISTIsCEs3ymHvRH7HB1FgwUzMzosZ7pjZFhbnGFg8PK/SUf6zIOgzrWoYJuBRRne5Nq+efeJs4uSJu6smaHSlCFAYhC3usCjMKDyvgR4op1Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781129962; c=relaxed/simple;
	bh=7sOXNZObj9IUkty4D2uhSgDz+9i+9axEpdnIFb4GJSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jyg7yz5fEJ+YCYJQfoRvklMgm1UIIzjR6GXisJuItQe42OLs9lYfPtT8d0Y+x6DMWPHqiZgRtmdm1FTIB4j5b5pb/ZT9CVprTk36zheV8hGdy1T5I3JSyXaZ2U8AObH69ENySqML3pv13012aR8nhw7WzH54zM3YR+QNBi1+F8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z+uJaMX6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z+uJaMX6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95C911F00893;
	Wed, 10 Jun 2026 22:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781129961;
	bh=g6tx6uH607t0QMVlmv6fEuJQLYuABn41Vu4ZVF6Ffk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z+uJaMX6oG7AB1LTv5oZf8IiZ6sS1CYP8JGuDCgKxHiL38fGm6yXeMIjiD9adauN6
	 Zu7khftzggh6vRNwSVfOh65gIeJm4JzK4lfzx2HKOxgndooNIJh0VF0TjPm2ttKbuE
	 crNOjq12oVuMK+ChgRBlCChGLN49Q81z5JHOiVesx3rfL7Gog46e+L45Ls25vjFNGt
	 fYmL3f9s//wvrIDxiEZocqvVeWdqPVAPQ/0tdkyjzaij40ne7OktvSPhmYOmm1VBve
	 KC0lC1Up8Qugg3sI4+T6do5iDqNozIMd92ycE2npkkWB8TBpaLCwZCWqFPHZ9e9euw
	 FrQ3boCKXlJwg==
Date: Wed, 10 Jun 2026 15:19:21 -0700
From: Kees Cook <kees@kernel.org>
To: Mert Seftali <mertsftl@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: gmin: Use str_on_off() helper
Message-ID: <202606101519.29D65E4068@keescook>
References: <20260610182348.217892-1-mertsftl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610182348.217892-1-mertsftl@gmail.com>

On Wed, Jun 10, 2026 at 08:23:48PM +0200, Mert Seftali wrote:
> Replace the open-coded "on" : "off" ternary with the standard
> str_on_off() helper from <linux/string_choices.h>. This improves
> readability and reuses the kernel's existing string helper instead of
> duplicating the literals.
> 
> No functional change intended.
> 
> Signed-off-by: Mert Seftali <mertsftl@gmail.com>

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook
