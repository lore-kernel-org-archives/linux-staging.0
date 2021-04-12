Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537E271
	for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 21:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Qxt5hGUGCIOriu3kYww5GhknJDLjCA6JPdqgUUXGgoM=; b=VLET7wPtaKrRRfzF3FNJlosHRs
	53TLpy3ZIicI9BERoQtjnoFJlwpUzX8HnbaYJsoxLg5uBj+SKIZj6qAi3eWpDydUCJP9/HpJmwFAr
	Z56xeKGBAEub2TWsJq5FtlCH/A3wCmS4v0aEtWXrQcdSlDjaq42QuTNBbdJOukIrhyAa7UaePgnpe
	nKBsKF11XQGNYYBamyaHJHf+M1c3TOmzwEO7LD2xhMwJ53WoamQYVhMGwUIUj3iK5WfW7S7vmoiu9
	zXvWat8+TfVWJl3owoRTgnQMog6i6FUooBAO/LmAoGM2KcrdqVp310Y1NyVR4jSOCQzhil7G26Cpc
	ZRTeIWhg==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
	id 1lW3rh-004tEt-Qe; Mon, 12 Apr 2021 21:13:04 +0000
Date: Mon, 12 Apr 2021 22:13:01 +0100
From: Matthew Wilcox <willy@infradead.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: outreachy-kernel@googlegroups.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [Outreachy kernel] [PATCH] staging: rtl8723bs: hal: Remove
 camelcase
Message-ID: <20210412211301.GO2531743@casper.infradead.org>
References: <20210412210258.8061-1-fmdefrancesco@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210412210258.8061-1-fmdefrancesco@gmail.com>

On Mon, Apr 12, 2021 at 11:02:58PM +0200, Fabio M. De Francesco wrote:
> Removed camelcase in (some) symbols. Further work is needed.

What would be more useful for this driver is making it use
drivers/net/wireless/realtek/rtlwifi/btcoexist/ which has already
graduated out of staging.  I haven't checked how closely it matches,
but this is surely a better use of time than "cleaning up" this version.
