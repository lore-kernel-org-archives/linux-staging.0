Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF57A1E1DE5;
	Tue,  7 Jul 2026 11:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783422201; cv=none; b=t9Gb34Tnmc2+jcsObajK1rKJIwNreprL3JIQFPIzKIaV5JwVkgqiAQvMtDHJowrFAUx47pCoGqYKZuE6R7agJq0b3wIQBXQBswNIipv/eMQ0QwPfF4lABYGoFuI4cqY3Q5WR94WEtJSoz7NrNKXgr8Ib+CbISvAS0Bzi0sns4pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783422201; c=relaxed/simple;
	bh=GtAUGwHN/CUWVDFzjpjpAx7Kk/avCRCePWK9cuJ1TWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rbvu/S+B5/CvwvwNcxM7hRgIIfJ/CHOxpeC+5ehvZ+xHdO+EJWi7ws0jAHUl+QpgDFkMTGByirdlAjGq/ZXMiAHAe/AagtMNmI6CH+/bUqsODKoLRkh66b/x/FGwVfoMAM4ZLAH5ShuyyRBxFoUrtfXTtyT9KnzaQQIa3z6M+Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mGzDJQPK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mGzDJQPK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0C361F000E9;
	Tue,  7 Jul 2026 11:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783422200;
	bh=5bfCLU2qk2Ya6OB47cLkQWuZwwFWxTCa4mTotbSK1Ng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mGzDJQPKEXYRgw0we1ak2oyLyxTzUtGRKMY9+wsa62+tGRQsSxym8BAI8a+2E/+au
	 x9C1FLxfxSa+l/INBt1Dvb/D8xfGk2WCC/PhEEn8YObo8Ykxzs3Fn+qiZbHUQLpeOR
	 3C2WxAeFFLouasuvX6dBFqzEbZZ5cTKl16bWfgOU=
Date: Tue, 7 Jul 2026 13:03:17 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Rename camelcase variable
 dot11PrivacyAlgrthm
Message-ID: <2026070710-headstone-enamel-c37b@gregkh>
References: <ah6_GQWX8e8CjDN_@koolguy>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah6_GQWX8e8CjDN_@koolguy>

On Tue, Jun 02, 2026 at 11:31:37AM +0000, Dalvin-Ehinoma Noah Aiguobas wrote:
> Rename variable dot11PrivacyAlgrthm to dot11_privacy_algrthm in
> struct security_priv to resolve checkpatch.pl CamelCase finding.
> 
> Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>

Does not apply to the latest tree :(
