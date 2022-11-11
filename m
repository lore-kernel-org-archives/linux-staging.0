Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FDA2F2B
	for <linux-staging@lists.linux.dev>; Fri, 11 Nov 2022 17:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1668186674; bh=1RIQ/IkEDUmv9IHs9QgFqfOSQHFRaOMUNJ4hAer8V7U=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=i7Ych6tATqnDt3txDGmf4tl2aOt6j5CZYTlZdYNIJWf5jIb9uQuKygWkgFAfZdqt/
	 pYrneCIpfWlMV9VzuVz1ZdUqjO5895K1q/RDvnlQak9uzy2G+RuZRW4GNIOXG9pjr+
	 /MEslRNG8FbBCpBUn7yCQyVWVglS7ckWx9LuL6Ws=
Received: by b-2.in.mailobj.net [192.168.90.12] with ESMTP
	via ip-206.mailobj.net [213.182.55.206]
	Fri, 11 Nov 2022 18:11:14 +0100 (CET)
X-EA-Auth: V+drH4vY8UWXrgfnZZR7Hc2mA9wgmxew3GLoFUFYAmzIxO1+7Zdb/tpLl6NXQrz5gJPwo7XaSp0gWCF9ff8cCxjJDfF2L6q4
Date: Fri, 11 Nov 2022 22:41:03 +0530
From: Deepak R Varma <drv@mailo.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Dan Carpenter <error27@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: patches for staging:media drivers
Message-ID: <Y26CJ9L52AmPBQYC@qemulion>
References: <Y2eSCZJNWn6DzCUu@qemulion>
 <48f4bda9-b5e3-9649-aab9-b529889bf110@linaro.org>
 <Y2oO7fU4whKr+3hb@kadam>
 <Y2q7tFF7YeX16H20@lunn.ch>
 <Y2tLZaPSUT45TF4f@qemulion>
 <Y2uv56k515cKTXU4@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2uv56k515cKTXU4@lunn.ch>

On Wed, Nov 09, 2022 at 02:49:27PM +0100, Andrew Lunn wrote:
> On Wed, Nov 09, 2022 at 12:10:37PM +0530, Deepak R Varma wrote:
> > On Tue, Nov 08, 2022 at 09:27:32PM +0100, Andrew Lunn wrote:
>
> Staging drivers for network tend to be USB dongles for WiFi. Some of
> those drivers need throwing away and starting again, others need less
> work. If you are interested in that, i would suggest asking on
> linux-wireless@vger.kernel.org.
>
> Another option might be pi433? The problem with that is, i don't know
> how it fits into the rest of the network stack? Could it maybe fit
> under ieee802154? Or is it just unique and needs to do its own thing?

Hello Andrew,
I looked at the pi433 driver and it appears to be a good starting point. I have
started studying more about the hardware, the RF technology etc. There is a TODO
file with reasonable challenges.

Thank you for the recommendation.

Have a nice weekend!
./drv

>
>       Andrew
>


