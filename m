Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC53370
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 06:58:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D644460FDB;
	Tue, 13 Apr 2021 06:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1618297119;
	bh=At7tv/t6+u+Xed4C9ESv3PLB9A4rw88+He4xQJrhC8E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uF0mHX87ApqlGgu9151snbVoO5F+wIjbsZdjqFB9dP9GZ73EsdAzJT8LUtHy9rZGC
	 mdP+VB6xzHjCu9fB8SnJxOKn3Ey9Kp51nH4h/3wgBcZEFU2Anizjcg7a7etG7FkOM+
	 IEdEN9aXBt4mdjF3YIzY2C1Kchu3H2E6+SfitlK4=
Date: Tue, 13 Apr 2021 08:58:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mitali Borkar <mitaliborkar810@gmail.com>
Cc: narmstrong@baylibre.com, mchehab@kernel.org, khilman@baylibre.com,
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	linux-amlogic@lists.infradead.org, mitali_s@me.iitr.ac.in
Subject: Re: Subject: [PATCH v2] staging: media: meson: vdec: declare u32 as
 static const appropriately
Message-ID: <YHVBGhoZXnVYfeKE@kroah.com>
References: <YHU56OM+C2zY34VP@kali>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHU56OM+C2zY34VP@kali>

On Tue, Apr 13, 2021 at 11:57:52AM +0530, Mitali Borkar wrote:
> Declared 32 bit unsigned int as static constant inside a function
> appropriately.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>

Why does your Subject: line have "Subject:" twice?
