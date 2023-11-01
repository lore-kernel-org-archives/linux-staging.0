Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885BC6AA5;
	Wed,  1 Nov 2023 08:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1eVxPEI2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA2B5C433C8;
	Wed,  1 Nov 2023 08:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698826164;
	bh=ig3zqGMgh53+mBu+TuaqJ6OObjdIWEMg9RxlNCU5XPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1eVxPEI20y54j3XE5zBMejhF/FUsrZNu2XnKzbWKJfG4U6SZ9Mq2gwfuJ0gEHQZBN
	 poues8GfWmSZUnTmeny2I9HJ1gFtOn1MwJba9XinsHLHb8lYPnblkUwQICe2N1r/X1
	 cPnuMz6jztf/16Cr/6uF/2hluOX73obX7TJml6eU=
Date: Wed, 1 Nov 2023 09:09:21 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>,
	Linux Outreachy <outreachy@lists.linux.dev>,
	Linux Staging Drivers <linux-staging@lists.linux.dev>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Charles Han <hanchunchao@inspur.com>
Subject: Re: [PATCH] staging: vme: enhance the help paragraphs for clarity
Message-ID: <2023110152-snack-circle-3bf9@gregkh>
References: <20231029180346.8570-1-dorine.a.tipo@gmail.com>
 <ZUIAyQGSfIKqK7AE@debian.me>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZUIAyQGSfIKqK7AE@debian.me>

On Wed, Nov 01, 2023 at 02:39:53PM +0700, Bagas Sanjaya wrote:
> [Cc'ing driver contributors found via get_maintainer.pl. Also Cc: Charles from
> linux-doc mailing list as wording patches like this one most likely suit him.]

Please do not, that's the responsibility of the outreachy applicant to
do, as it is documented very well what needs to happen here.

thanks,

greg k-h
