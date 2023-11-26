Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615ABCA56
	for <linux-staging@lists.linux.dev>; Sun, 26 Nov 2023 10:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ldeDO7ed"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DABA2C433C7;
	Sun, 26 Nov 2023 10:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700994628;
	bh=jBYZySQmXXp7GkW2G6nnviQuF9V1/gxHhjXx0DeK0SY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ldeDO7edZmsVA5Y4AerlWeeMy4DzbaV8PStYdQrcPrpbp0zKNKIG40qbe6codZSql
	 D+xvj52x0zz0WSFFcWh/62OGhtPLyRG2NgsP6b1YV92Y17/7Mv++SUW4bnAQvpTIND
	 CAPlohUpSzeMlkGmZJxqaK8/jn1i+shTZ2SZPJDA=
Date: Sun, 26 Nov 2023 10:30:25 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Gary Rookard <garyrookard@fastmail.org>
Cc: philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] staging: rtl8192e: renamed 2 variables nMcsRate,
 mcsRate
Message-ID: <2023112616-scallop-drier-ab16@gregkh>
References: <20231125223432.13780-1-garyrookard@fastmail.org>
 <20231125223432.13780-2-garyrookard@fastmail.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231125223432.13780-2-garyrookard@fastmail.org>

On Sat, Nov 25, 2023 at 05:34:28PM -0500, Gary Rookard wrote:
> Renamed 2 variables from CamelCase to Snake case nMcsRate
> and mcsRate.
> nMcsRate -> n_mcs_rate

Please drop the "n".

thanks,

greg k-h
