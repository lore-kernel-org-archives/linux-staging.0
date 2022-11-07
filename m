Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9DB2F37
	for <linux-staging@lists.linux.dev>; Mon,  7 Nov 2022 18:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1667847432; bh=k0P8ZE+uqQGVs6wL7Q7U7sf2vt2NmAe+s9GmSscWQ0c=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=eC9931eWOAk5D6YxDQdpohg9OWEYrmGecMyIJrZLxY2yaxzl/anSb3ebTj7ejMDgs
	 R2VDj5avBMf4HqebeaDNc/39cJTs8lVTmC6KZ1qM8kGfRs1YHOoCWxUfKCvrTWc7nl
	 j8atkUi9WqzVKfpAaso6Dl9riohSOImjHlqKpELM=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
	via ip-206.mailobj.net [213.182.55.206]
	Mon,  7 Nov 2022 19:57:12 +0100 (CET)
X-EA-Auth: uJYbcnbU7/Gnv/kEAbQmGdQCJ/olU5GTMJpo6jMiKW/YsivpNT2VbpYQVLnhqIqXLpu6xC/hldMuQtAOfKssKWdyCKfS7j0U
Date: Tue, 8 Nov 2022 00:27:03 +0530
From: Deepak R Varma <drv@mailo.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: patches for staging:media drivers
Message-ID: <Y2lU/78ZFoVElIp4@qemulion>
References: <Y2eSCZJNWn6DzCUu@qemulion>
 <48f4bda9-b5e3-9649-aab9-b529889bf110@linaro.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48f4bda9-b5e3-9649-aab9-b529889bf110@linaro.org>

On Mon, Nov 07, 2022 at 06:29:30PM +0100, Neil Armstrong wrote:
> Hi,
>
> On 06/11/2022 11:52, Deepak R Varma wrote:
> > Greetings to all.
> > My name is Deepak R Varma and I was part of the recent Outreachy internship
> > round. I learned during this program that patches for the media drivers were
> > prohibited to be included in the Outreachy effort due to lack of bandwidth for
> > the maintainers to respond on those.
> >
> > The Outreachy round is now over but I am continuing to work on code improvement
> > and changes. I would like to know if it is okay for me to now identify
> > opportunities in the media drivers and send patch proposal for your kind
> > consideration. I intend to send couple of Coccinelle identified code
> > improvements as patches.
> >
> > Please let me know.
>
> I won't say no but since the media maintainers will need to apply them,
> the problem is the same.

Hello Neil,
Thank you for responding. I will send in the patches. I am sure they will be
reviewed at an appropriate time and responded accordingly.

Have a good day!
./drv

>
> Neil
>
> >
> > Thank you,
> > ./drv
> >
> >
>
>


