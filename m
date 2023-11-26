Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCAB1C16
	for <linux-staging@lists.linux.dev>; Sun, 26 Nov 2023 10:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HX8PoIbV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4A87C433C7;
	Sun, 26 Nov 2023 10:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700994595;
	bh=76Fk0DLzKgmqcjG7nPYWawqfhDzTfjUtNJQgpxhd74w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HX8PoIbVw5umcqY4/1z60IIL2oeh6yK5Z/CsImpgOCbq8fm9ncYTGWW2BFEJj7gBD
	 cUNQ6tvZE7WqE08mcSZgViFLLFPdEDhGf83T8yxfIqmEzOXJMt1BpVoCDIZENA0Lk2
	 QcHHGzUHDoDYawmzSmbAgSSBxTAmLP3tu9A3xTjo=
Date: Sun, 26 Nov 2023 10:29:52 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Gary Rookard <garyrookard@fastmail.org>
Cc: philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] staging: rtl8192e: renamed variable bCurBW40MHz
Message-ID: <2023112618-subdued-genetics-8062@gregkh>
References: <20231125223432.13780-1-garyrookard@fastmail.org>
 <20231125223432.13780-4-garyrookard@fastmail.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231125223432.13780-4-garyrookard@fastmail.org>

On Sat, Nov 25, 2023 at 05:34:30PM -0500, Gary Rookard wrote:
> Renamed from CamelCase to Snake case the variable bCurBW40MHz.
> bCurBW40MHz -> b_cur_bw_40mhz

Same here, why keep the "b"?  "b" usually means "byte" which of course
means nothing here, so it can be dropped.

thanks,

greg k-h
