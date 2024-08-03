Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F75B67E
	for <linux-staging@lists.linux.dev>; Sat,  3 Aug 2024 03:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722655751; cv=none; b=imj3I4DrQy/t65K0pSJq1NYXekEAqGclL5UcRgs410WRkodeBAfFaq/ZQQsgTynG46unbb72mn4r3lkSk0vMAEqXNQqnp0AhVOJcJnf+KcAf18slt6Hg52RsMuAsKPTW0HR4NKFtrWQDxAtDIYjF5p1qA4fWdJIH7hyuFJlMDY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722655751; c=relaxed/simple;
	bh=V+5SWEhdUx/PT2rg1YC48hJQGvbxbFyZ/tQDnJq8Obw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cgvsgPhpjibOvswrNu7d/S1VG9uT2HIa5o8uyvW+yQqNdfoIDtHaGk+izCxiWzOQB/V2Isg7whe+q4vEJyrhETqYHMusKaTItYKARGlEF/ISLWZIXCQ6Ob6sDLaWWVxK8D/9Tpiv7QofUOwxi6jXqUx1PPtHYEUF28s+HqrUwr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=spwhitton.name; spf=pass smtp.mailfrom=spwhitton.name; dkim=pass (2048-bit key) header.d=spwhitton.name header.i=@spwhitton.name header.b=Bfv0J/Q9; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=ShZyfamE; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=spwhitton.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=spwhitton.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=spwhitton.name header.i=@spwhitton.name header.b="Bfv0J/Q9";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="ShZyfamE"
DKIM-Signature: a=rsa-sha256; b=Bfv0J/Q9WL4LyPd3I1rutoDMULBvDM+o/PBBYDbFuxcemrvBRznLMCIdoARrimElSCWM1X4TQLg8qqrfJOQ9XwUwqtS6w4nTWoXiD+ks41MDdLJK5vLXuzchdtEwEVx872WzcUAoDObFb0ngOV8t72NuW+1/2e6YAoM495JryqPMUBK9Damhi5at+2Ij/xgm/mqzHvVRZErVI4E/25WmfqgoRYJO2IBWyqnwf09gLJv4BNf27ia1UxTHFvIhS3JAqnkYKQjcxoLIWJM5S8JYdxmRL8VT/+5XKMoejb8HvEG+kDtSP7Jw09gtSM3Nx3R3EQjJZf5c1fC8MayxF0PIEg==; s=purelymail2; d=spwhitton.name; v=1; bh=V+5SWEhdUx/PT2rg1YC48hJQGvbxbFyZ/tQDnJq8Obw=; h=Received:Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=ShZyfamEZKgbMLyaR0XxXN53u4rMxvxqDKxNWCZNrygurgwOCwmykbNriUPk+1GsynZ7DQQJmO27qry4R3yqt1ypDhRd8kyYuxwQdXwU2fM91gf+/+Z0aBnrylmCcn8XCdCvq758pJzfK8bi8tx20/bQ5mnRripXrrJUATFCf1EyoL5Ve6nAu8DglgIKVbU4MI/RBcj6QJqqKnic+v7DFTaxTZ/fZiY0L/n5JAt57oTEjwNNoPcNRRlnKGDAZXoGKn0RzkI0gwuSnsgto7Ko2BT5y74XQt3FWFwmJWUvOdM4JB6YyVezWO8FJv58Aj8iP6mtZKR8sJGY+1hKhZs7qA==; s=purelymail2; d=purelymail.com; v=1; bh=V+5SWEhdUx/PT2rg1YC48hJQGvbxbFyZ/tQDnJq8Obw=; h=Feedback-ID:Received:Received:From:To:Subject:Date;
Feedback-ID: 20115:3760:null:purelymail
X-Pm-Original-To: linux-staging@lists.linux.dev
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -868321867;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sat, 03 Aug 2024 03:28:06 +0000 (UTC)
Received: by melete.silentflame.com (Postfix, from userid 1000)
	id D47867E3D83; Sat,  3 Aug 2024 12:28:02 +0900 (KST)
From: Sean Whitton <spwhitton@spwhitton.name>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: ~lkcamp/patches@lists.sr.ht,  helen.koike@collabora.com,  Hans de Goede
 <hdegoede@redhat.com>,  Mauro Carvalho Chehab <mchehab@kernel.org>,
  Sakari Ailus <sakari.ailus@linux.intel.com>,
  linux-media@vger.kernel.org,  linux-staging@lists.linux.dev,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: Add parentheses around macro
 definitions
In-Reply-To: <2024073020-reload-vanquish-f937@gregkh> (Greg Kroah-Hartman's
	message of "Tue, 30 Jul 2024 08:38:51 +0200")
References: <20240730062348.46205-2-spwhitton@spwhitton.name>
	<2024073020-reload-vanquish-f937@gregkh>
Date: Sat, 03 Aug 2024 11:28:02 +0800
Message-ID: <87v80i475p.fsf@melete.silentflame.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Hello,

On Tue 30 Jul 2024 at 08:38am +02, Greg Kroah-Hartman wrote:

> This isn't a "complex values", and really should just be removed
> entirely and use the correct "static inline" properly.

I found that there are several headers in
atomisp/pci/hive_isp_css_include which have this pattern of defining an
_INLINE_*_ preprocessor constant, and using it to choose between
'extern' and 'static inline' in each file where the header is included.

I don't know what the author's intention was.  Are you saying that you
think this preprocessor mechanism should just be replaced with
hardcoding 'extern' or 'static inline' in each file which includes one
of these headers?

Thanks!

-- 
Sean Whitton
