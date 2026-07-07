Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDC03F411F;
	Tue,  7 Jul 2026 11:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783422746; cv=none; b=hbCL9804McaLeRNwPvWzMb4YYvF2o5BYMPz17OoOnFAR2y7QKNyf02jaGTqR4j6OsMouWrWnlgvsYbIWqPW3WmS5maXljU8x/YrXxGtjbxpwNPxmzjWjBgJ114v1oy2xOG99ZTRxTaJny5cUWVDHetNIRexx23hLSVn1MrEhyz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783422746; c=relaxed/simple;
	bh=5IaoBcpSdSWtqoZURp+tlBuQqUUs+iAnqgm81vsDSus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u7HjW0vSC/ZOM081QUbjQ6ywceQ9cX9O1X0yVN/F/WmLPBbdxKPuV2nPS/Wbn5vEaMMT6tfgabOcpt7wKk4k+qQAjbzhXyUUmH5A3SJ47qBCiRz32PxXZQamAR1xn8b9Qj3+4QbvYaW1SjXNMPoS3pF7NjXI9dd99TY2V5Pyy+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nskZfygc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nskZfygc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2BD61F000E9;
	Tue,  7 Jul 2026 11:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783422743;
	bh=VAE/9TLW9FWDEPdMtXNoAn394IxPzho1GKlRCvmkKLU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nskZfygcIBr6ZisMRmAK00UscuMsbsDpy1gSyFEyiSj8Ax2f5ifNS1AIAKAqzni8q
	 jywkodLn453cXvKC87YlIObHteCLogHu8O3p1wdGy3qOfzZGbFOvD3+IkLKw5AU0qs
	 76hQ/ChC7xWT1+cRtVl6znFP02XOaVK679MfF4wE=
Date: Tue, 7 Jul 2026 13:12:20 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: Dan Carpenter <error27@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] staging: rtl8723bs: convert update_attrib path to
 errno
Message-ID: <2026070705-headboard-buckle-8c09@gregkh>
References: <20260616235241.99076-1-dennylin0707@gmail.com>
 <ajKKynn13sv-_UZl@stanley.mountain>
 <CAGEkeHc+gxyu0htaJCOxTLYcps35UpM-giXfS4R2LV2a8p+10g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGEkeHc+gxyu0htaJCOxTLYcps35UpM-giXfS4R2LV2a8p+10g@mail.gmail.com>

On Wed, Jun 17, 2026 at 05:09:31AM -0700, Hungyu Lin wrote:
> On Wed, Jun 17, 2026 at 4:53 AM Dan Carpenter <error27@gmail.com> wrote:
> >
> > The first three patches are fine.  Where is patch 4?
> 
> Looks like patch 4/4 was blocked by Gmail and never made it through.
> 
> I'll resend it separately.

Please resend the whole series at once, otherwise our tools can not pick
them all up properly.

thanks,

greg k-h
