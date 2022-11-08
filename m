Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672D08BE7
	for <linux-staging@lists.linux.dev>; Tue,  8 Nov 2022 15:23:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97869C433D6;
	Tue,  8 Nov 2022 15:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1667921016;
	bh=uS0okb+qfQuarqze9+mm9LuFlTvjUVNK5qOFiOfm210=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rHkE3wlH5cFW/b5r68j3qWGrMqoa84JePsIEzElGK1iBRX13wlPfFql6WuKS4Ujxd
	 reSeXGE+/v7PAKf4uk1wBfpGdmj1D/48hKUaLqqdRShpRi8g7xcs0UaCKhYhdMVNug
	 FK4p2cwBzUEMrqarpycMMiuFbVRX1MjzVyHvAJbs=
Date: Tue, 8 Nov 2022 16:23:32 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jacob Bai <jacob.bai.au@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] staging: rtl8192e: rename r8192E_hwimg.c/h to
 table.c/h
Message-ID: <Y2p0dNLBqiWFPzB9@kroah.com>
References: <cover.1667723306.git.jacob.bai.au@gmail.com>
 <9bb563727915e3f3edd863837608336b99564462.1667723306.git.jacob.bai.au@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9bb563727915e3f3edd863837608336b99564462.1667723306.git.jacob.bai.au@gmail.com>

On Sun, Nov 06, 2022 at 07:31:17PM +1100, Jacob Bai wrote:
> Same as other rtlwifi drivers, use table.c/h.

You say what you do here, but not why.

Why rename the file?  What's wrong with the existing name?  It's not
causing any problems, right?

thanks,

greg k-h
