Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E504185B
	for <linux-staging@lists.linux.dev>; Wed, 20 Apr 2022 16:28:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F719C385A0;
	Wed, 20 Apr 2022 16:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1650472127;
	bh=1NrwORl7TpAJ23BH9sDvu1Q+P5kuqJUNPzBg+nFEQeQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SEWj9WpK1NklvjCLRgMxfOYs1q+9GpPzyuvNkoKun3XgUhGWx/s4oOvUa6q2BkaId
	 ekFPz1DAg+mTh3SHUFBjXdON9HjfCobQa7CcvtnhinS4gwVWZwgSYa9kGrdu5VDXyy
	 Hr0g2TYQW7EecOz8n7PjoMLV+IWq4Ftis6ZTVMVc=
Date: Wed, 20 Apr 2022 18:28:44 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Xiaomeng Tong <xiam0nd.tong@gmail.com>
Cc: vaibhav.sr@gmail.com, dan.carpenter@oracle.com, mgreer@animalcreek.com,
	johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] greybus: audio_codec: initialize data to silence
 static checker warnings
Message-ID: <YmA0vHtvNmv9PNi9@kroah.com>
References: <20220414084219.13501-1-xiam0nd.tong@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220414084219.13501-1-xiam0nd.tong@gmail.com>

On Thu, Apr 14, 2022 at 04:42:19PM +0800, Xiaomeng Tong wrote:
> These three declares are here:
> 	struct gbaudio_data_connection *data;
> 
> Since all three of these functions check for if the codec->module_list is
> empty at the start of the function so these are not real bugs to bypass
> 'if (!data) {'. To avoid static checker warnings like Smatch, initialize
> the data with NULL.

We do not work around broken tools, we ask that the tools be fixed.

thanks,

greg k-h
