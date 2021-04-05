Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8EC70
	for <linux-staging@lists.linux.dev>; Mon,  5 Apr 2021 01:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WFTs1r/K720X27EVNRCFyCxYPcB0o1qMFJEeae/Czms=; b=oQKzIc0H4wFKK2RV4RRnFv/bGo
	8WYhmyiEBFjwrefylJzoDrmSUPJGB9BzJxfxUtBisr8L/yH1ISZt8Imu2RoIGwqBiWXglnlagYpnx
	Y3X9wjAv6mF0nAX6mjFWXt8zV225snVe0WuGIEZe1OXTK6yZfLtxGOKEXabdHfH2znvW4Wc2joFVF
	5wySigb+UaF1XCzFaTi8t+6qsBxmtVFZ4hOx4V6sfh4EtlJXnIjo5nv+pxsRQoogiyy7qDGCkBT/F
	C0ZrzxlCLkx9O7pqqcEYYtH4lz6rUmfzGxUGx4OSXM5Wp4efNzvp5OmvU9XjLc74PSLO7KU11yk80
	l2m2nG2Q==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
	id 1lTDnv-00Aliq-KS; Mon, 05 Apr 2021 01:13:26 +0000
Date: Mon, 5 Apr 2021 02:13:23 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Mitali Borkar <mitaliborkar810@gmail.com>
Cc: manish@marvell.com, GR-Linux-NIC-Dev@marvell.com,
	gregkh@linuxfoundation.org, outreachy-kernel@googlegroups.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [Outreachy kernel] [PATCH] staging: qlge: remove else after break
Message-ID: <20210405011323.GB2531743@casper.infradead.org>
References: <YGpcx9MZuZJFy0Z/@kali>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YGpcx9MZuZJFy0Z/@kali>

On Mon, Apr 05, 2021 at 06:11:43AM +0530, Mitali Borkar wrote:
> -		} else {
> -			netif_err(qdev, drv, qdev->ndev,
> +		}	netif_err(qdev, drv, qdev->ndev,

That's not the normal indentation style ... does checkpatch really not
complain about that?

>  				  "IDC: Invalid State 0x%.04x.\n",
>  				  mbcp->mbox_out[0]);
>  			status = -EIO;
>  			break;
> -		}
>  	}
>  
>  	return status;
> -- 
> 2.30.2
> 
> -- 
> You received this message because you are subscribed to the Google Groups "outreachy-kernel" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to outreachy-kernel+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/outreachy-kernel/YGpcx9MZuZJFy0Z/%40kali.
