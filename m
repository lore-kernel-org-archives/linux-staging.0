Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037E62C6A2;
	Fri, 15 Dec 2023 12:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sQq0yAxf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22AAFC433C9;
	Fri, 15 Dec 2023 12:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1702643924;
	bh=n/dsZODETjwZ+luDmDM02P8G13Kq9Ci+ItMuMCMmuFc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sQq0yAxfwgV/nP7sa1JPX7BD5Xam8TgzoqGZnFmZczd4YN1n4WNAOnYlSkDiX6YYi
	 4olQ4S1ngJmc5nYytAOMCa95aj6dd0tyXV68aAj7ZCNnJcwnuGPmUyAp84aK/nzOy0
	 VFpfZTAbiTPXKCvCJVbHsNVu9BJIeeN1v39dLIz0=
Date: Fri, 15 Dec 2023 13:38:33 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Gary Rookard <garyrookard@fastmail.org>
Cc: philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] [Series 3] rename variable HTGetHighestMCSRate and
 (4) other
Message-ID: <2023121508-onboard-acutely-3640@gregkh>
References: <20231213175459.5425-1-garyrookard@fastmail.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213175459.5425-1-garyrookard@fastmail.org>

On Wed, Dec 13, 2023 at 12:54:54PM -0500, Gary Rookard wrote:
> Hi,
> 
> This patch series renames (5) different variables with
> the checkpatch coding style issue Avoid CamelCase.
> 
> Patch 1/5) rename variable HTGetHighestMCSRate
> Patch 2/5) rename variable HTFilterMCSRate
> Patch 3/5) rename variable HTSetConnectBwMode
> Patch 4/5) rename variable HTOnAssocRsp
> Patch 5/5) rename variable HTInitializeHTInfo
> 
> Signed-off-by: Gary Rookard <garyrookard@fastmail.org>

As was pointed out, not all of these patches will apply against my tree
(same for your previous series.)  Please rebase all of these and
resubmit the remaining ones.

thanks,

greg k-h
