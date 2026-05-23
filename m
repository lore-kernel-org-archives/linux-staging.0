Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CFC233956;
	Sat, 23 May 2026 04:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779509833; cv=none; b=Ro5xcOVFgXbH1j2c7Bx9d7dleNmTKlVvaiw3xVMdO1NgX5EqEyLwWnDBn1n8xdgq6OyggiGJbiaBq6X6/IRTDpc0LHM6aOYeLtJO/fKzjWLGkl78V9rZua8FrmW9USkVZXWKrZmu8Dn00zywyMXhbbTSDpri07LBehJWO9plaj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779509833; c=relaxed/simple;
	bh=XZ8247GrcNtjU1uIbe4ZtSq7HRRybrhsOiXNewESLXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W7WMc3vIiSOiJ9sA8y6biUagtHzyhaY+mg/y5RN2GfOy09TJqmOeQp1P2iwqNeuHzJ1ZAvNJfztP08p78wV2V0P8UKdunrmwTUsMpj38kBFIu+P7f3EaBsP2lqOunA/qJD/jYlimKBbJ66CQjm3p8dAPvjX5DwtyHKpz8ZnMomQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mgpI3bgt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mgpI3bgt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82E361F000E9;
	Sat, 23 May 2026 04:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779509830;
	bh=XZ8247GrcNtjU1uIbe4ZtSq7HRRybrhsOiXNewESLXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mgpI3bgtVAEeiAhTFOiFhQiPYFxGSXJYhuFczX3cq4R2wZzZhIiCU6pg9wRk4uTn8
	 lsL0NqN01+PJjfOwb8o2l1GndQ1CXg8OSSjjO0dfw5RONNeeU9wrQQMs1muprAweuq
	 sBpVakgYDMrtML0fDH3bVqtGaYGMcew8ie8I8xVs=
Date: Sat, 23 May 2026 06:17:12 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	omer.e.idrissi@gmail.com
Subject: Re: [PATCH v2 2/3] staging: cleanup whitespace of sdio_intf.c
Message-ID: <2026052355-bucktooth-rejoicing-c86d@gregkh>
References: <20260522114317.189368-4-manuelebner@mailbox.org>
 <20260522115701.190482-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522115701.190482-2-manuelebner@mailbox.org>

On Fri, May 22, 2026 at 01:57:02PM +0200, Manuel Ebner wrote:
> remove empty lines, add lines where appropriate
> reformat function declaration

That is multiple different things, which of course need multiple
different patches.

thanks,

greg k-h
