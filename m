Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25E2468B
	for <linux-staging@lists.linux.dev>; Mon,  2 Oct 2023 09:03:16 +0000 (UTC)
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RzZh05Fr1z67g0b;
	Mon,  2 Oct 2023 17:01:36 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Mon, 2 Oct
 2023 10:03:08 +0100
Date: Mon, 2 Oct 2023 10:03:07 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: David Lechner <dlechner@baylibre.com>, <linux-iio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-staging@lists.linux.dev>, David Lechner
	<david@lechnology.com>, Jonathan Cameron <jic23@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Michael Hennerich <Michael.Hennerich@analog.com>, Nuno =?ISO-8859-1?Q?S?=
 =?ISO-8859-1?Q?=E1?= <nuno.sa@analog.com>, Axel Haslam
	<ahaslam@baylibre.com>, Philip Molloy <pmolloy@baylibre.com>,
	<linux-kernel@vger.kernel.org>, Apelete Seketeli <aseketeli@baylibre.com>
Subject: Re: [PATCH v3 01/27] dt-bindings: iio: resolver: add devicetree
 bindings for ad2s1210
Message-ID: <20231002100307.000032c9@Huawei.com>
In-Reply-To: <2416fa1b-86f1-40d5-b7b5-5fe85e0a8472@kadam.mountain>
References: <20230929-ad2s1210-mainline-v3-0-fa4364281745@baylibre.com>
	<20230929-ad2s1210-mainline-v3-1-fa4364281745@baylibre.com>
	<2416fa1b-86f1-40d5-b7b5-5fe85e0a8472@kadam.mountain>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected

On Mon, 2 Oct 2023 11:02:40 +0300
Dan Carpenter <dan.carpenter@linaro.org> wrote:

> On Fri, Sep 29, 2023 at 12:23:06PM -0500, David Lechner wrote:
> > From: David Lechner <david@lechnology.com>
> > 
> > From: David Lechner <dlechner@baylibre.com>
> >   
> 
> Having two from headers kind of messes things up.  The second From is
> included in the body of the commit message.
> 
> regards,
> dan carpenter

Strangely b4 + git am didn't do that.  I was assuming I'd need
to fix these by hand but didn't need to.  I thanked my lucky
stars for a few mins saved and didn't look into why ;)

e.g.
https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git/commit/?h=testing&id=b3689e14415a874630f0894d8c3ac7ea01603d57

BTW, David replied to the cover letter to call out this mess up.



