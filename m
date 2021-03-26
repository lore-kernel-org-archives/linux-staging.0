Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC1770
	for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 14:04:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1CF3261A24;
	Fri, 26 Mar 2021 14:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1616767498;
	bh=vMSUvf24P+BbnIkY1afRyKlIc+soCeej3LVYf9U9baI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lrysWY/HdBfg4FPX4OrPsqGnOhJrgmGwaqZs2dV5Hx6wdhpWB+mQgB8qe0hTpPsEw
	 j/saBvwROKHhnNXiwlWTKZ31Fj1wTBk40BEhk6yonkFwRDobqMKKf9O6Z8nWWiE6lT
	 lBIYxnrT3hnHYfAeXnpxSFBfeAOaUW0urZFWup4o=
Date: Fri, 26 Mar 2021 15:04:56 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Marco Cesati <marcocesati@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] Staging: rtl8723bs: remove obsolete comments
Message-ID: <YF3qCIiB9gs1TnLb@kroah.com>
References: <20210324194721.14574-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210324194721.14574-1-marcocesati@gmail.com>

On Wed, Mar 24, 2021 at 08:47:21PM +0100, Marco Cesati wrote:
> Remove some obsolete comments in the staging/rtl8723bs driver.
> 
> Signed-off-by: Marco Cesati <marcocesati@gmail.com>

Also does not apply :(
