Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D85E63B5;
	Fri, 10 Mar 2023 19:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1678475885; bh=zqyO4bs9LK6fs7y+SygD1t3p1TpwGsNuiTjcvcdIkXs=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=MUB6BV/FUJDpFeU7hzTviUmzIbBlYgtRZ1wMOGkjLXzhZXG/uhiZB/AAQh9/14XWj
	 UlgNqtWZTYA4k37y1aP2bhDhKke2DWLsxdDW/tr69qvt9b/pnOEP3oqmb2prcri1U7
	 90M6p8OO/X8ERY4ACp2yXZuIlD9lvZ3u9qYNrniw=
Received: by b221-3.in.mailobj.net [192.168.90.23] with ESMTP
	via ip-20.mailobj.net [213.182.54.20]
	Fri, 10 Mar 2023 20:18:05 +0100 (CET)
X-EA-Auth: jpHp83SeGtVf0lyiyIBpKOv7LiaKqrsgrRLCj45b0ccQgIpkccUPzAItcRyxtWX2bBdgaIpc2eke/ePNeXkXSKwkRtgLm+lv
Date: Sat, 11 Mar 2023 00:47:59 +0530
From: Deepak R Varma <drv@mailo.com>
To: Khadija Kamran <kamrankhadijadj@gmail.com>
Cc: outreachy@lists.linux.dev, Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: fix exceeds line length
Message-ID: <ZAuCZ/xD/UaR+6kR@ubun2204.myguest.virtualbox.org>
References: <ZAtkW6g6DwPg/pDp@khadija-virtual-machine>
 <ZAt4irZnVJW4zQNb@ubun2204.myguest.virtualbox.org>
 <ZAt9e8Xnd4wAnjPn@khadija-virtual-machine>
 <ZAt+wJIhq780Ms4T@ubun2204.myguest.virtualbox.org>
 <ZAuB6hJ3pOWxnWuS@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZAuB6hJ3pOWxnWuS@khadija-virtual-machine>

On Sat, Mar 11, 2023 at 12:15:54AM +0500, Khadija Kamran wrote:
> Hi Deepak!
> If I join the if condition to one line, the line length becomes 97
> columns. Would that be okay?

Yes, the line length limit is recently revised to 100 characters.


