Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C1A79F4
	for <linux-staging@lists.linux.dev>; Sun, 15 Oct 2023 16:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IE+5KY8A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 014F1C433C8;
	Sun, 15 Oct 2023 16:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697386763;
	bh=Foq+ZKV/up+n3+BeC7Sr70gK9IRTMkWGt417DsVXgbw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IE+5KY8AC8FjKBp/hRikyXzLu+jQ3HKQG/7I+14CBEOpcg/cjz1/Af+KB1G0o/5+q
	 TqaOaks8xETWyTVzMfkUVoAVVRG0IFC4XI4vYGLv08XLUdfssPc0IeuCRrUEgpP6bG
	 q2b3q9xBVWBpNkZbMACidwbWRSWrbiTRC9+CjYQE=
Date: Sun, 15 Oct 2023 18:19:20 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>
Cc: hdegoede@redhat.com, Larry.Finger@lwfinger.net, ruanjinjie@huawei.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Remove unnecessary bracks
Message-ID: <2023101548-catalyze-employed-a617@gregkh>
References: <20231013002944.14607-1-edson.drosdeck@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231013002944.14607-1-edson.drosdeck@gmail.com>

On Thu, Oct 12, 2023 at 09:29:44PM -0300, Edson Juliano Drosdeck wrote:
> Warning found by checkpatch.pl script.Remove bracks than are not necessary for
> a single statement blocks in hal/odm.c

"bracks"?  I think it is called "brackets", right?

thanks,

greg k-h
