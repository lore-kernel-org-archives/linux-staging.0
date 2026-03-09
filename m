Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141A0175A7B;
	Mon,  9 Mar 2026 16:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773072377; cv=none; b=MEBB8jYId5Lnx1QDcry5VUfUoFBv5QFYW5IrdWhO7uzS7nO11HG6WW3JmsX3+nTVc9pq83hK6r5318m1ocLXxpVcRmSduRmTB0wZ7YOhTY9fkj2hbPLrYjcYT1Wxwe0U3dYS1Ffw1Isz173jRHjSKFMY/hukeokqd/IRP5KEiD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773072377; c=relaxed/simple;
	bh=DyBhcJidUZIYszsGJgUIFNCuhaaQDXbk4VebE0J8Sv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nAbM/c1HBy8IsyhliwcAJXevZ8Ivp3mA1FpjGHh8tY5B2v17H9eeqD1u9IRzHCP/LUy6GCDK3IDy4hxeO6hIc2ganSwZLGV8WB7slkM4cpLmuhusDY4kC7ZYaY8ACgaqJKx4kjUiJWQIKw5aqSLocVewda4FpvSJj2m4ItFpOMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xNGRlC/d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xNGRlC/d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C257C4CEF7;
	Mon,  9 Mar 2026 16:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773072376;
	bh=DyBhcJidUZIYszsGJgUIFNCuhaaQDXbk4VebE0J8Sv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xNGRlC/dlC1nDD3yxQDXd1gpCY75zWKe+cobaO1W5/z8SXRjSwCGgx3yllY6YiqJF
	 1KMed1XUTWEWYHqD6be8a4blbDLBYZyZDUOj/0A0qRyQYL7jRnXoc19OKrOzvexhM0
	 qtAYzea5/neR88EmdWNXQQ/sIwkwtmYYPdabgGn0=
Date: Mon, 9 Mar 2026 17:06:14 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Rivka Bukchin <rivkab300@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: fix CamelCase variable names
Message-ID: <2026030905-surprise-contents-af4f@gregkh>
References: <20260302160849.2693-1-rivkab300@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302160849.2693-1-rivkab300@gmail.com>

On Mon, Mar 02, 2026 at 06:08:49PM +0200, Rivka Bukchin wrote:
> Rename pHT_info_ie and pHT_caps_ie to ht_info_ie and ht_caps_ie
> to address checkpatch CamelCase warnings and follow snake_case
> naming convention used in the kernel.
> 
> Signed-off-by: Rivka Bukchin <rivkab300@gmail.com>

Does not apply to my current tree :(
