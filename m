Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9208070
	for <linux-staging@lists.linux.dev>; Fri,  7 May 2021 16:10:54 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 147G4Adh086590;
	Fri, 7 May 2021 16:10:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=nEnE5wFYSYTsPSfUNC5sSsowJuUzDZIkBkljEYuijxw=;
 b=ADgPVVmiYw84/lBkBCifmJA5n0D6D9LLL/Tj0qJIzP5FPUwg8qUT31WYpQ0FUofH9InW
 Gku2InVy4ZFi/yDKTJcWQg34gS/ZLHL3ijlB5hhLApRLzKd+2+jnoQ37vcPP3JQr0PgM
 J4xIJKAEywqDwFoZv4+izHafqE6F71OK4TGf5d6o4KYqNCGz9nRNX4K87yCADeiMHTpu
 iMM1L6SaXlQ35JpW1Xsq22xAb6OuNRdAjunRAnc9mechmoGELy4343fhIZyfeqwKq+hs
 O2SGLSzpk1f/UWqwpa68WltzLRs6NddgUzbNbkFebsaACng7XFW7AGApRRMH3P/vj6Zz zA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by aserp2120.oracle.com with ESMTP id 38ctjv22qg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 07 May 2021 16:10:44 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 147G6SwB076169;
	Fri, 7 May 2021 16:10:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by aserp3020.oracle.com with ESMTP id 38csrttg41-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 07 May 2021 16:10:44 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 147G6Svs076150;
	Fri, 7 May 2021 16:10:43 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by aserp3020.oracle.com with ESMTP id 38csrttfyu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 07 May 2021 16:10:43 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 147GAfnA011862;
	Fri, 7 May 2021 16:10:41 GMT
Received: from kadam (/102.36.221.92)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Fri, 07 May 2021 09:10:40 -0700
Date: Fri, 7 May 2021 19:10:34 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: Greg KH <greg@kroah.com>, linux-staging@lists.linux.dev
Subject: Re: Bouncing messages from linux-staging@lists.linux.dev
Message-ID: <20210507161034.GH1955@kadam>
References: <1620376201-3408-mlmmj-4f932172@lists.linux.dev>
 <20210507090826.GA2106@agape.jhs>
 <YJUnqO8Dje/gZPEd@kroah.com>
 <20210507143201.GA1408@agape.jhs>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210507143201.GA1408@agape.jhs>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: GLDkYunp66N4QxcWw_esErEiK1WPVC0T
X-Proofpoint-GUID: GLDkYunp66N4QxcWw_esErEiK1WPVC0T
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9977 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 mlxlogscore=999
 malwarescore=0 phishscore=0 mlxscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105070109

On Fri, May 07, 2021 at 04:32:02PM +0200, Fabio Aiuto wrote:
> On Fri, May 07, 2021 at 01:42:32PM +0200, Greg KH wrote:
> > On Fri, May 07, 2021 at 11:08:27AM +0200, Fabio Aiuto wrote:
> > > Hi all,
> > > 
> > > On Fri, May 07, 2021 at 08:30:01AM +0000, linux-staging+owner@lists.linux.dev wrote:
> > > > Greetings!
> > > > 
> > > > This is the mlmmj program managing the <linux-staging@lists.linux.dev>
> > > > mailing list.
> > > > 
> > > > Some messages to you could not be delivered. If you're seeing this
> > > > message it means things are back to normal, and it's merely for your
> > > > information.
> > > > 
> > > > Here is the list of the bounced messages:
> > > > - 2608
> > > > 
> > > > 
> > > 
> > > what I'm supposed to do now if I'd want to retrieve the bounced message?
> > 
> > What do you mean by "retrieve"?
> 
> bring back home the message 2608 which is a message to me that could
> not be delivered. I mean, a message sent to me which was never delivered...
> 
> If I didn't misunderstand.

Just ignore it.  We all got the same message.  If it's really important
people will resend.

regards,
dan carpenter

