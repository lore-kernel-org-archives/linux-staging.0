Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024E84C6D;
	Thu, 15 Oct 2026 02:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792030950; cv=none; b=Ih6ddXSOVgQIwiPwDWoz4VKOypPnFTB0C/zLSYZtuTb6A1UKq8VX+oQZ4pK54k49LvmBeWXP80cnKTDlpWRedhySH+kOC+mS0mP+H0N/msyPL1tXb233OLyzMQbFmfK1sewPCbPf/wKzt+/Yr+i/nrq/9e6cUJUDB6yNfQ9HQ2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792030950; c=relaxed/simple;
	bh=ptlvY4GyN1Szen2Zlc62nSTAG1mlbJjXwA3RU8tu3eg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Iz6XIcYtkV/+cmJtBmyukyeZwtNosiaWOxrG97v1RWAk+wAOL4sVg1To1XRdYCVJ47YrTiIjQQkXkc5bmQyp05CUO38/kR4bTfrnqIi7UJjxuClv+XYkt6kPsRlzcp1YmB9co8yF+pPmQY1TY2aqXPen6gx+9Zp4+RCR5M9m6d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=FrpYx4LQ; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="FrpYx4LQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=M5urV4Du4gv+/AM+1fa4OQuLjDSmps5PFX1r1B4wZlw=;
  b=FrpYx4LQyo2mZtua4vG+4bQp86OTlFPcSgTYVH2nUxcrBtnIfZQf4aB9
   OppKbCziIlcLI5jQbQ6vsazvydKk+XYUvfvTia9KQFoPHxua1P3EMrv62
   5pDh47Q5/E2YnCGVUm/nwKCmmnyg/jiHkusd55R7PhlKswLvNUyKzCclG
   w=;
X-CSE-ConnectionGUID: Ek4CdOcxTh+KMV2TAX7ERg==
X-CSE-MsgGUID: Q+Um1q9kQeKy+ip2gX6/8A==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,158,1787004000"; 
   d="scan'208";a="300261319"
Received: from static.host-68-71-1-178.nrbn.ca (HELO hadrien) ([68.71.18.178])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 04:22:25 +0200
Date: Wed, 14 Oct 2026 22:22:24 -0400 (EDT)
From: Julia Lawall <julia.lawall@inria.fr>
To: Jeremy Clifton <deaner92@yahoo.com>
cc: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, 
    Alex Elder <elder@kernel.org>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, outreachy@lists.linux.dev, 
    greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: greybus: Remove unused header declaration
 to_fw_mgmt_connection
In-Reply-To: <b19b8058-bfe9-4800-95c8-d2db889b43e6@yahoo.com>
Message-ID: <a82dbd9e-061-a415-25cf-b8760484baa@inria.fr>
References: <20261014174248.97561-1-deaner92.ref@yahoo.com> <20261014174248.97561-1-deaner92@yahoo.com> <2d2106c-a2d2-2bec-b368-c03850cba9a7@inria.fr> <b19b8058-bfe9-4800-95c8-d2db889b43e6@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Wed, 14 Oct 2026, Jeremy Clifton wrote:

> On 10/14/26 7:46 PM, Julia Lawall wrote:
> >
> >
> > On Wed, 14 Oct 2026, Jeremy Dean Clifton wrote:
> >
> >> Previous commit removing a function definition did not remove the
> >> function prototype.
> >
> > Please use proper English.
> >
> > The commit 3228900f80c2 ("staging: greybus: Remove unused function
> > 'to_fw_mgmt_connection'") removing a function definition did not remove
> > the function prototype.
> >
> >>
> >> commit 3228900f80c2 ("staging: greybus: Remove unused function
> >> 'to_fw_mgmt_connection'")
> >>
> >> Function header declaration needs to be removed after definition
> >> removal.
> >
> > This is saying what you did.  It should be in the imperative:
> >
> > Remove the prototype.
> >
>
> "Remove the prototype." in the imperative has been changed.
>
> >> There is no definition of this function nor is there any place where it
> >> is called.
> >
> > Not sure this is needed, since the definition was removed previously.
>
> It's been removed.
>
> The next revision is sent.

I haven't received it.  Maybe the mailing list is slow again.

julia
