Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B744171C1
	for <linux-staging@lists.linux.dev>; Sun, 26 May 2024 14:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716733403; cv=none; b=D5RQ9DkHWLMinh9+uPISZHEvnT5lR43rx7+czYhUhvLSiKOA+42Wpklh6mu+jUNIEE/aUd6Zuw47v9aO/yZz+QBuD0NW4Rb5PGriwAXTRf9w7kRqg2FGQUrZGLoa7Q1PhMrj9hz3eVsazMF0XZ4WqYKS3xmJ5HJqXlP7XPF27Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716733403; c=relaxed/simple;
	bh=0Htsacbl71hMZ/JTxhHysgW2DC0GjMffsquDYGrL/oU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d79SwRaG9DaolrN/Sjs2TLpSBH0czWzsaiMF9cMtUXiPr6ZClLvk/87XgU1l44gXD5HO/YRFZfB0OvH3zpabBvv3EfNggaPzcb71GAUk+uW0c2gZSdJHx5MV2zYuo2R0cM/9L8nS/LixVzUFRUT8dQhdaS4fF5VsM/GlM3CIxkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZSqgDlld; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=5YvxaNoY; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZSqgDlld";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="5YvxaNoY"
Date: Sun, 26 May 2024 16:23:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1716733398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xnCZ27QyK1irI3tnt2syPDNGF9wfvIINvO/4hdl5qxk=;
	b=ZSqgDlldMYgaRq0ImxIGO8GhOkh2H5EfzkftWY6MUNgx/osEHiJgmrLdPyY2XcLL3q0byq
	gtIF3SAPVCnuAzVyF6XHvxa7DJBSjTs9Ku8wI2qQYT7pMDRhj4pY2w180Ah+FcEHvjw8M8
	FkgvLgLyTuqrgyLoA+/qRTWTpJkfUDmyvMM5WW7cOj+7Nbj9CRPWFQhAGRgbGr0Xa8ejfj
	0EWrRJYXMOjWHB22Hpx8iuGGpkOcyXV9HEZmIT84tKBFwG2eMw5GUvTz3IbovU6jeD+sxZ
	C5RAhff1jQ1wq06Bw3gGOXCure/kmkbtDO82K4d3zIIppo0ZDig1Z87Qo5S84A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1716733398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xnCZ27QyK1irI3tnt2syPDNGF9wfvIINvO/4hdl5qxk=;
	b=5YvxaNoYNyYciKG2s/KkZerhDtblGES6SSQquaBB7zdwzPPajujWBUhNRw36PPQtQqnlp+
	WpVW1Ap1UN0yw4Ag==
From: Nam Cao <namcao@linutronix.de>
To: Michael Straube <straube.linux@gmail.com>
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] staging: rtl8192e: reduce indentation level
Message-ID: <20240526142311.e1zY6b-Z@linutronix.de>
References: <20240526111928.14574-1-straube.linux@gmail.com>
 <20240526111928.14574-2-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240526111928.14574-2-straube.linux@gmail.com>

On Sun, May 26, 2024 at 01:19:26PM +0200, Michael Straube wrote:
> Reduce indentation level in _rtl92e_dm_rx_path_sel_byrssi() by negating
> if statements and use continue in for loops. This way the indentation
> level of the code that is covered by the if checks can be reduced. This
> improves readability and clears two checkpatch warnings.
> 
> WARNING: Too many leading tabs - consider code refactoring
> 
> Signed-off-by: Michael Straube <straube.linux@gmail.com>

I don't see any functional change. This patch does as described:

Reviewed-by: Nam Cao <namcao@linutronix.de>

Best regards,
Nam
