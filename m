Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E9770
	for <linux-staging@lists.linux.dev>; Wed,  4 Aug 2021 13:56:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 62CA260EE5;
	Wed,  4 Aug 2021 13:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1628085362;
	bh=TTcXcx99NIQPlex6LtkkmZlGoGeBqNMM7TOBv6w6SQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mlrA+L4wY3WKCUTCz4vZUlwETaymD1kcf3JRcmlYlqf89g8CZ0YMSYlW1OgtMkSIz
	 bAtO+J7H7fl3ZL59kBF4k1dEwD6VWE4BkCD70Ns40cKlnaR8/1VkdUvsmO9O8gv8+e
	 6/R5c7+u0Uh/8oIGcXKdX405X9r9qZg+ip8cOuxk=
Date: Wed, 4 Aug 2021 15:56:00 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: SAURAV GIREPUNJE <saurav.girepunje@gmail.com>
Cc: fabioaiuto83@gmail.com, marcocesati@gmail.com, ross.schm.dev@gmail.com,
	insafonov@gmail.com, linux-staging@lists.linux.dev,
	saurav.girepunje@hotmail.com, moun.girepunje@gmail.com
Subject: Re: Post to linux-staging@lists.linux.dev denied: [PATCH] staging:
 rtl8723bs: os_dep: remove unused variable
Message-ID: <YQqccPSjYA/lR11g@kroah.com>
References: <1628081824-28535-mlmmj-16bf2009@lists.linux.dev>
 <YQqZ4TlTzZGIaixJ@user>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YQqZ4TlTzZGIaixJ@user>

On Wed, Aug 04, 2021 at 07:15:05PM +0530, SAURAV GIREPUNJE wrote:
> On Wed, Aug 04, 2021 at 12:57:04PM +0000, linux-staging+owner@lists.linux.dev wrote:
> > Greetings!
> >
> > This is the mlmmj program managing the <linux-staging@lists.linux.dev>
> > mailing list.
> >
> > The message from <saurav.girepunje@gmail.com> with subject "[PATCH]
> > staging: rtl8723bs: os_dep: remove unused variable" was unable to be
> > delivered to the list because the list address was not found in either the
> > To: or CC: header.
> >
> > (The denied message is below.)
> 
> > Date: Wed, 4 Aug 2021 18:26:57 +0530
> > From: Saurav Girepunje <saurav.girepunje@gmail.com>
> > To: gregkh@linuxfoundation.org;, fabioaiuto83@gmail.com;,
> >  saurav.girepunje@gmail.com;, marcocesati@gmail.com;,
> >  ross.schm.dev@gmail.com;, insafonov@gmail.com;,
> >  linux-staging@lists.linux.dev;, linux-kernel@vger.kernel.org;
> > Cc: saurav.girepunje@hotmail.com

Why do you have ";" in your email addresses here?

Try removing them.
